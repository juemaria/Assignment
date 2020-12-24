//
//  Review_TableViewCell.swift
//  Assignmentt
//
//  Created by Jue Maria on 12/23/20.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit

class Review_TableViewCell: UITableViewCell {

    @IBOutlet weak var reviews_Label: UILabel!
    @IBOutlet weak var reviwerName_Label: UILabel!
    @IBOutlet weak var qualityTag: UILabel!
    @IBOutlet weak var review_Badge: UILabel!
    @IBOutlet weak var rating_Imageview:UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
