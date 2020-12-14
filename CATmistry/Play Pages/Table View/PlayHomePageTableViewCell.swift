//
//  PlayHomePageTableViewCell.swift
//  CATmistry
//
//  Created by N HJ on 27/11/20.
//

import UIKit

class PlayHomePageTableViewCell: UITableViewCell {
    @IBOutlet var playChapterImageView: UIImageView!
    @IBOutlet var playChapterLabel: UILabel!
    @IBOutlet var needMorePointsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        needMorePointsLabel.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
