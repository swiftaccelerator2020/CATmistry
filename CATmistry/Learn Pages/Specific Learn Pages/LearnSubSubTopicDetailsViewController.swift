//
//  LearnSubSubTopicDetailsViewController.swift
//  CATmistry
//
//  Created by N HJ on 30/11/20.
//

import UIKit
import Foundation

class LearnSubSubTopicDetailsViewController: UIViewController {

    var flexibleTitle: String!
    var specificChapter: SubSubTopic!
    var subTopicName: String!

    @IBOutlet weak var subSubTopicImageView: UIImageView!
    @IBOutlet weak var warningView: UIView!
    @IBOutlet weak var warningImageView: UIImageView!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var firstAttributeLabel: UILabel!
    @IBOutlet weak var secondAttributeLabel: UILabel!
    @IBOutlet weak var thirdAttributeLabel: UILabel!
    @IBOutlet var warningIsVisibleConstraint: NSLayoutConstraint!
    @IBOutlet var warningIsHiddenConstraint: NSLayoutConstraint!
    @IBOutlet weak var indicatorsSliderVertStack: UIStackView!
    @IBOutlet weak var indicatorSlider: UISlider!
    @IBOutlet weak var indicatorSliderValueLabel: UILabel!
    @IBOutlet weak var indicatorSliderView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = flexibleTitle

        if specificChapter.content.warningText != nil {
            warningView.layer.cornerRadius = 5
            warningImageView.image = "⚠️".image()
            warningLabel.text = specificChapter.content.warningText
            warningIsVisibleConstraint?.isActive = true
            warningIsHiddenConstraint?.isActive = false
        } else {
            warningView.isHidden = true
            warningIsVisibleConstraint?.isActive = false
            warningIsHiddenConstraint?.isActive = true
        }

        subSubTopicImageView.image = UIImage(named: specificChapter.content.image)
        firstAttributeLabel.text = specificChapter.content.firstAttributionText
        secondAttributeLabel.text = specificChapter.content.secondAttributionText
        thirdAttributeLabel.text = specificChapter.content.thirdAttributionText
        
        contentViewHeight.constant -= CGFloat(specificChapter.contentHeightDifference)

        if (subTopicName != "Indicators") {
            indicatorsSliderVertStack.isHidden = true
        } else {
            indicatorSlider.value = 7.00
            if (7.00 < specificChapter.content.lowpH!) {
                indicatorSliderValueLabel.text = "Current pH: 7.00 \n" + specificChapter.content.lowpHColorName!
                indicatorSliderView.backgroundColor = hexStringToUIColor(hex: specificChapter.content.lowpHColor!)
            } else if (7.00 > specificChapter.content.lowpH! && 7.00 < specificChapter.content.highpH!) {
                indicatorSliderValueLabel.text = "Current pH: 7.00 \n" + specificChapter.content.middlepHColorName!
                indicatorSliderView.backgroundColor = hexStringToUIColor(hex: specificChapter.content.middlepHColor!)
            } else if (7.00 > specificChapter.content.highpH!) {
                indicatorSliderValueLabel.text = "Current pH: 7.00 \n" + specificChapter.content.highpHColorName!
                indicatorSliderView.backgroundColor = hexStringToUIColor(hex: specificChapter.content.highpHColor!)
            }
        }
    }

    @IBAction func indicatorSliderValueChanged(_ sender: UISlider) {
        if specificChapter.topic == "Universal Indicator" {
            let universalIndicatorColoursArray = [
                "EF1D2C",
                "F6643A",
                "F98F30",
                "FFC33D",
                "FFF23A",
                "83C34D",
                "49B751",
                "3B9C57",
                "00B8B6",
                "4390CA",
                "3753A1",
                "5A519F",
                "6D227E",
                "49176C"
            ]
            let universalIndicatorColourNamesArray = [
                "Red",
                "Dark Orange",
                "Orange",
                "Light Orange/Dark Yellow",
                "Yellow",
                "Light Green",
                "Green",
                "Dark Green",
                "Light Blue",
                "Blue",
                "Dark Blue",
                "Light Purple",
                "Purple",
                "Dark Purple"
            ]
            indicatorSliderValueLabel.text = "Current pH: " + String(round(indicatorSlider.value)) + "\n" + universalIndicatorColourNamesArray[Int(round(indicatorSlider.value)) - 1]
            indicatorSliderView.backgroundColor = hexStringToUIColor(hex: universalIndicatorColoursArray[Int(round(indicatorSlider.value)) - 1])
        } else {
            if (indicatorSlider.value < specificChapter.content.lowpH!) {
                indicatorSliderValueLabel.text = "Current pH: " + String(format: "%.2f", indicatorSlider.value) + "\n" + specificChapter.content.lowpHColorName!
                indicatorSliderView.backgroundColor = hexStringToUIColor(hex: specificChapter.content.lowpHColor!)
            } else if (indicatorSlider.value > specificChapter.content.lowpH! && indicatorSlider.value < specificChapter.content.highpH!) {
                indicatorSliderValueLabel.text = "Current pH: " + String(format: "%.2f", indicatorSlider.value) + "\n" + specificChapter.content.middlepHColorName!
                indicatorSliderView.backgroundColor = hexStringToUIColor(hex: specificChapter.content.middlepHColor!)
            } else if (indicatorSlider.value > specificChapter.content.highpH!) {
                indicatorSliderValueLabel.text = "Current pH: " + String(format: "%.2f", indicatorSlider.value) + "\n" + specificChapter.content.highpHColorName!
                indicatorSliderView.backgroundColor = hexStringToUIColor(hex: specificChapter.content.highpHColor!)
            }
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

    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
