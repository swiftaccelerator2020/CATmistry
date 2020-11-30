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

    @IBOutlet weak var subSubTopicImageView: UIImageView!
    @IBOutlet weak var firstAttributeLabel: UILabel!
    @IBOutlet weak var secondAttributeLabel: UILabel!
    @IBOutlet weak var thirdAttributeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        subSubTopicImageView.image = UIImage(named: specificChapter.content.image)
        firstAttributeLabel.text = specificChapter.content.firstAttributionText
        secondAttributeLabel.text = specificChapter.content.secondAttributionText
        thirdAttributeLabel.text = specificChapter.content.thirdAttributionText
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
