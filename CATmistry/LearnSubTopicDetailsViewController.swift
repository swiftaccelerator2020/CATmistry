//
//  LearnSubTopicDetailsViewController.swift
//  CATmistry
//
//  Created by N HJ on 28/11/20.
//

import UIKit

class LearnSubTopicDetailsViewController: UIViewController {
    
    var specificSubTopic: SubTopic!

    @IBOutlet weak var pHSlider: UISlider!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var subSubTopicsTableView: UITableView!
    @IBOutlet weak var pHSlidersVertStack: UIStackView!
    @IBOutlet var pHSliderVertStackIsVisibleConstraint: NSLayoutConstraint!
    @IBOutlet var pHSliderVertStackIsHiddenConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = specificSubTopic.navTitle
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        definitionLabel.text = specificSubTopic.content.definition
        
        if (!specificSubTopic.needSlider) {
            pHSlidersVertStack.isHidden = true
            pHSliderVertStackIsVisibleConstraint.isActive = false
            pHSliderVertStackIsHiddenConstraint.isActive = true
        } else {
            pHSlidersVertStack.isHidden = false
            pHSliderVertStackIsVisibleConstraint.isActive = true
            pHSliderVertStackIsHiddenConstraint.isActive = false
        }
        
        if (specificSubTopic.subTopics == nil) {
            subSubTopicsTableView.isHidden = true
        }
        
    }
    

    @IBAction func sliderChangedValue(_ sender: UISlider) {
        sliderValueLabel.text = "Current pH: " + String(Int(sender.value.rounded()))
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
