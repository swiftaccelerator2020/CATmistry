//
//  SettingsTableViewCell.swift
//  CATmistry
//
//  Created by N HJ on 12/12/20.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

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
        let shareText = "CATmistry - Chemistry, Gamified - is a Chemistry learning app specifically designed for Upper Primary and Lower Secondary students. With many interactive learning elements and fun games, CATmistry is sure to provided a fun and engaging learning experience. \n\nFind us on the app store now:"
        let shareURL = NSURL(fileURLWithPath: "https://itunes.apple.com/app/id1544696258")
        let vc = UIActivityViewController(activityItems: [shareText, shareURL], applicationActivities: [])
        self.window?.rootViewController?.present(vc, animated: true, completion: nil)
    }
    
}
