//
//  CellTableViewCell.swift
//  Cuisini
//
//  Created by Oybek on 2/10/21.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        img.layer.cornerRadius = img.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
