//
//  PlayHomePageTableViewCell.swift
//  CATmistry
//
//  Created by N HJ on 27/11/20.
//

import UIKit

class PlayHomePageTableViewCell: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
