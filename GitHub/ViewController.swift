//
//  ViewController.swift
//  GitHub
//
//  Created by Viktoriia Rohozhyna on 2/21/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var aToz = true
    @IBOutlet weak var AZBtn: UIButton!
    @IBAction func sortingBtn(_ sender: UIButton) {
        if aToz == true {
            repositories.sort() {  ($0.name?.lowercased())! < ($1.name?.lowercased())! }
            aToz = false
            AZBtn.setTitle("Z-A", for: .normal)
            tableView.reloadData()
        } else {
            repositories.sort() {  ($0.name?.lowercased())! > ($1.name?.lowercased())! }
            aToz = true
            AZBtn.setTitle("A-Z", for: .normal)
            tableView.reloadData()
        }
    }
    var repositories = [Repository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON {
            self.tableView.reloadData()
        }
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "myCell")
        cell.textLabel?.text = "\(repositories[indexPath.row].name ?? "name")"
        cell.detailTextLabel?.text = " ★ = \(repositories[indexPath.row].stargazers_count ?? 0) ,   ⑂ = \(repositories[indexPath.row].forks_count ?? 0)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.repository = repositories[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://api.github.com/users/CocoaPods/repos")
        URLSession.shared.dataTask(with: url!) { ( data, response, error) in
            if error == nil {
                do {
                    self.repositories = try JSONDecoder().decode([Repository].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("Error JSON")
                }
            }
            } .resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

