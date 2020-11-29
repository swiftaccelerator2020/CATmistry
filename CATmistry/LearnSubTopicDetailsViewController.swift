//
//  LearnSubTopicDetailsViewController.swift
//  CATmistry
//
//  Created by N HJ on 28/11/20.
//

import UIKit

class LearnSubTopicDetailsViewController: UIViewController {
    
    var specificSubTopic: SubTopic!

    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var PHSlider: UILabel!
    @IBOutlet weak var contentTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = specificSubTopic.title
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        definitionLabel.text = specificSubTopic.content.definition
        if ((specificSubTopic.subTopics?.isEmpty) != nil){
            contentTable.isHidden = true
        }
        
    }
    

    @IBAction func sliderChangedValue(_ sender: UISlider) {
        PHSlider.text = String(Int(sender.value.rounded()))
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
