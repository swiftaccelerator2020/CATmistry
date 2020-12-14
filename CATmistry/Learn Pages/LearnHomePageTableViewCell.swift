//
//  learnPageTableViewCell.swift
//  CATmistry
//
//  Created by Wang Zerui on 27/11/20.
//

import UIKit

class LearnHomePageTableViewCell: UITableViewCell {
    @IBOutlet var learnChapterImageView: UIImageView!
    @IBOutlet var learnChapterLabel: UILabel!
    @IBOutlet var needMorePointsLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        needMorePointsLabel?.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
