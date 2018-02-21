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
    @IBOutlet weak var urlLbl: UILabel!
    @IBOutlet weak var forksLbl: UILabel!
    @IBOutlet weak var startLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var tagsLbl: UILabel!
    var repository:Repository?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = repository?.name
        descriptionsLbl.text = repository?.description
        urlLbl.text = repository?.url
        forksLbl.text = String(describing: repository?.forks_count)
        startLbl.text = String(describing: repository?.stargazers_count)
        
        

    }

    
}
