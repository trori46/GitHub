//
//  myTableViewCell.swift
//  GitHub
//
//  Created by Viktoriia Rohozhyna on 2/21/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var forks: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var stars: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
