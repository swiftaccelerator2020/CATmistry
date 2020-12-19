//
//  SettingsTableViewCell.swift
//  CATmistry
//
//  Created by N HJ on 12/12/20.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    var shareAction: (() -> Void)? = nil

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var settingsImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func shareButtonClicked(_ sender: Any) {
        shareAction?()
    }

}
