//
//  learnPageTableViewCell.swift
//  CATmistry
//
//  Created by Wang Zerui on 27/11/20.
//

import UIKit

class LearnHomePageTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var learnChapterImageView: UIImageView!
    @IBOutlet weak var learnChapterLabel: UILabel!
    @IBOutlet weak var needMorePointsLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.needMorePointsLabel?.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
