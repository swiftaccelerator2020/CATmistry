//
//  LearnSubSubTopicDetailsViewController.swift
//  CATmistry
//
//  Created by N HJ on 30/11/20.
//

import UIKit

class LearnSubSubTopicDetailsViewController: UIViewController {
    
    var flexibleTitle: String!
    var specificChapter: SubSubTopic!
    var subTopicName: String!

    @IBOutlet weak var subSubTopicImageView: UIImageView!
    @IBOutlet weak var warningImageView: UIImageView!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var firstAttributeLabel: UILabel!
    @IBOutlet weak var secondAttributeLabel: UILabel!
    @IBOutlet weak var thirdAttributeLabel: UILabel!
    @IBOutlet var warningIsVisibleConstraint: NSLayoutConstraint!
    @IBOutlet var warningIsHiddenConstraint: NSLayoutConstraint!
    @IBOutlet var indicatorsSliderVertStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = flexibleTitle
        
        subSubTopicImageView.image = UIImage(named: specificChapter.content.image)
        firstAttributeLabel.text = specificChapter.content.firstAttributionText
        secondAttributeLabel.text = specificChapter.content.secondAttributionText
        thirdAttributeLabel.text = specificChapter.content.thirdAttributionText
        
        if (subTopicName != "Indicators") {
            indicatorsSliderVertStack.isHidden = true
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
