//
//  TableViewCell.swift
//  Assignment
//
//  Created by Jue Maria on 12/22/20.
//  Copyright © 2020 gehqw. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var hotel_ImageView: UIImageView!
    @IBOutlet weak var Holder_View: UIView!
    @IBOutlet weak var hotelName_Label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
