//
//  SettingsTableViewCell.swift
//  CATmistry
//
//  Created by N HJ on 12/12/20.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    var shareAction: (() -> Void)? = nil

    @IBOutlet weak var dyslexicSwitch: UISwitch?
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var settingsImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if isDyslexic {
            dyslexicSwitch?.isOn = true
        } else {
            dyslexicSwitch?.isOn = false
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func isDyslexicSwitch(_ sender: Any) {
        if isDyslexic {
            isDyslexic = false
            ud.setValue(false, forKey: "dyslexic")
            let alert = UIAlertController(title: "Are you sure you would like to change this setting?", message: "The app will need to restart.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: { _ in
                fatalError()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
            // alert.present(UIViewController, animated: true, completion: nil)
        } else {
            isDyslexic = true
            ud.setValue(true, forKey: "dyslexic")
            let alert = UIAlertController(title: "Are you sure you would like to change this setting?", message: "The app will need to restart.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: { _ in
                fatalError()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
            // alert.present(UIViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func shareButtonClicked(_ sender: Any) {
        shareAction?()
    }

}
