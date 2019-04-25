//
//  GroceryTableViewCell.swift
//  Grocery Challenge
//
//  Created by Sachin on 4/23/19.
//  Copyright © 2019 XYZ. All rights reserved.
//

import UIKit

class GroceryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
