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

    @IBOutlet var subSubTopicImageView: UIImageView!
    @IBOutlet var warningLabel: UILabel!
    @IBOutlet var firstAttributeLabel: UILabel!
    @IBOutlet var secondAttributeLabel: UILabel!
    @IBOutlet var thirdAttributeLabel: UILabel!
    @IBOutlet var warningIsVisibleConstraint: NSLayoutConstraint!
    @IBOutlet var warningIsHiddenConstraint: NSLayoutConstraint!
    @IBOutlet var indicatorsSliderVertStack: UIStackView!
    @IBOutlet var indicatorSlider: UISlider!
    @IBOutlet var indicatorSliderValueLabel: UILabel!
    @IBOutlet var indicatorSliderView: UIView!
    @IBOutlet var contentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = flexibleTitle

        if specificChapter.content.warningText != nil {
            warningLabel.layer.cornerRadius = 5
            warningLabel.layer.masksToBounds = true
            warningLabel.text = specificChapter.content.warningText
            warningIsVisibleConstraint?.isActive = true
            warningIsHiddenConstraint?.isActive = false
        } else {
            warningLabel.isHidden = true
            warningIsVisibleConstraint?.isActive = false
            warningIsHiddenConstraint?.isActive = true
        }

        subSubTopicImageView.image = UIImage(named: specificChapter.content.image)
        firstAttributeLabel.text = specificChapter.content.firstAttributionText
        secondAttributeLabel.text = specificChapter.content.secondAttributionText
        thirdAttributeLabel.text = specificChapter.content.thirdAttributionText

        if subTopicName != "Indicators" {
            indicatorsSliderVertStack.isHidden = true
        } else {
            indicatorSlider.value = 7.00
            if specificChapter.content.lowpH! > 7.00 {
                indicatorSliderValueLabel.text = "Current pH: 7.00 \n" + specificChapter.content.lowpHColorName!
                indicatorSliderView.backgroundColor = hexStringToUIColor(hex: specificChapter.content.lowpHColor!)
            } else if specificChapter.content.lowpH! < 7.00, specificChapter.content.highpH! > 7.00 {
                indicatorSliderValueLabel.text = "Current pH: 7.00 \n" + specificChapter.content.middlepHColorName!
                indicatorSliderView.backgroundColor = hexStringToUIColor(hex: specificChapter.content.middlepHColor!)
            } else if specificChapter.content.highpH! < 7.00 {
                indicatorSliderValueLabel.text = "Current pH: 7.00 \n" + specificChapter.content.highpHColorName!
                indicatorSliderView.backgroundColor = hexStringToUIColor(hex: specificChapter.content.highpHColor!)
            }
        }
    }

    @IBAction func indicatorSliderValueChanged(_: UISlider) {
        if indicatorSlider.value < specificChapter.content.lowpH! {
            indicatorSliderValueLabel.text = "Current pH: " + String(format: "%.2f", indicatorSlider.value) + "\n" + specificChapter.content.lowpHColorName!
            indicatorSliderView.backgroundColor = hexStringToUIColor(hex: specificChapter.content.lowpHColor!)
        } else if indicatorSlider.value > specificChapter.content.lowpH!, indicatorSlider.value < specificChapter.content.highpH! {
            indicatorSliderValueLabel.text = "Current pH: " + String(format: "%.2f", indicatorSlider.value) + "\n" + specificChapter.content.middlepHColorName!
            indicatorSliderView.backgroundColor = hexStringToUIColor(hex: specificChapter.content.middlepHColor!)
        } else if indicatorSlider.value > specificChapter.content.highpH! {
            indicatorSliderValueLabel.text = "Current pH: " + String(format: "%.2f", indicatorSlider.value) + "\n" + specificChapter.content.highpHColorName!
            indicatorSliderView.backgroundColor = hexStringToUIColor(hex: specificChapter.content.highpHColor!)
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

    func hexStringToUIColor(hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if cString.count != 6 {
            return UIColor.gray
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
