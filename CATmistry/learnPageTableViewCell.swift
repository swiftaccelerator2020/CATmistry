//
//  learnPageTableViewCell.swift
//  CATmistry
//
//  Created by Wang Zerui on 27/11/20.
//

import UIKit

class LearnPageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var subjectTitle: UILabel!
    @IBOutlet weak var iconPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
