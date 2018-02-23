//
//  DetailViewController.swift
//  GitHub
//
//  Created by Viktoriia Rohozhyna on 2/21/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionsLbl: UILabel!
    //@IBOutlet weak var urlLbl: UILabel!
    @IBOutlet weak var urlLbl: UIButton!
    @IBAction func urlTap(_ sender: Any) {
        if let website = repository?.html_url {
            let websiteURL = NSURL(string: "\(website)")! as URL
            UIApplication.shared.open(websiteURL, options: [:], completionHandler: nil)
    }
    }
    
    @IBOutlet weak var forksLbl: UILabel!
    @IBOutlet weak var startLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var tagsLbl: UILabel!
    var repository:Repository?
    var url: URL?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let brandView = UIImageView()
        brandView.image = #imageLiteral(resourceName: "git.png")
        brandView.contentMode = .scaleAspectFit
        navigationItem.titleView = brandView
        nameLbl.text = repository?.name
        descriptionsLbl.lineBreakMode = .byWordWrapping
        descriptionsLbl.numberOfLines = 0
        tagsLbl.lineBreakMode = .byWordWrapping
        tagsLbl.numberOfLines = 0
        descriptionsLbl.text = repository?.description
        urlLbl.setTitle(repository?.html_url, for: .normal)
        forksLbl.text = String(describing: (repository?.forks_count)!)
        startLbl.text = String(describing: (repository?.stargazers_count)!)
        let tag_u = String((repository?.tags_url)!)
        url = URL(string: tag_u)
        var text = String()
        downloadJSON {
            
            for i in self.tag {
                if i.name != nil {
                text += " #\(i.name!)"
            }
            }
            self.tagsLbl.text = text
        }
        

    }

    var tag = [Tag]()
    func downloadJSON(completed: @escaping () -> ()) {
        if url != nil {
        URLSession.shared.dataTask(with: url!) { ( data, response, error) in
            if error == nil {
                do {
                    self.tag = try JSONDecoder().decode([Tag].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("Error JSON")
                }
            }
            } .resume()
    }
    
}

    
}
