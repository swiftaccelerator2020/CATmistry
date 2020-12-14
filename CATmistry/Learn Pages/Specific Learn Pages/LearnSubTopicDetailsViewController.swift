//
//  LearnSubTopicDetailsViewController.swift
//  CATmistry
//
//  Created by N HJ on 28/11/20.
//

import UIKit

class LearnSubTopicDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var specificSubTopic: SubTopic!

    @IBOutlet var pHSlider: UISlider!
    @IBOutlet var maxLabel: UILabel!
    @IBOutlet var minLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    @IBOutlet var sliderValueLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var pHSlidersVertStack: UIStackView!
    @IBOutlet var pHSliderVertStackIsVisibleConstraint: NSLayoutConstraint!
    @IBOutlet var pHSliderVertStackIsHiddenConstraint: NSLayoutConstraint!
    @IBOutlet var pHImageView: UIImageView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    @IBOutlet var contentViewHeight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        pHSlider.value = 7
        sliderValueLabel.text = "Current pH: 7 \nWater"
        pHImageView.image = UIImage(named: "ph-7.png")

        let px = 1 / UIScreen.main.scale
        let frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: px)
        let line = UIView(frame: frame)
        tableView.tableHeaderView = line
        line.backgroundColor = tableView.separatorColor

        contentViewHeight.constant -= CGFloat(specificSubTopic.contentHeightDifference!)

        title = specificSubTopic.navTitle
        navigationController?.navigationBar.tintColor = UIColor.darkGray
        definitionLabel?.text = specificSubTopic.content.definition

        if !specificSubTopic.needSlider {
            if specificSubTopic.navTitle == "Periodic Table" {
                pHSlider.isHidden = true
                minLabel.isHidden = true
                maxLabel.isHidden = true
                sliderValueLabel.isHidden = true
                pHImageView.image = UIImage(named: "understand-periodic-table.png")
            } else if specificSubTopic.navTitle == "Elements" {
                pHSlider.isHidden = true
                minLabel.isHidden = true
                maxLabel.isHidden = true
                sliderValueLabel.isHidden = true
                pHImageView.image = UIImage(named: "understand-elements.png")
            } else {
                pHSlidersVertStack?.isHidden = true
                pHSliderVertStackIsVisibleConstraint?.isActive = false
                pHSliderVertStackIsHiddenConstraint?.isActive = true
            }
        } else {
            pHSlidersVertStack?.isHidden = false
            pHSliderVertStackIsVisibleConstraint?.isActive = true
            pHSliderVertStackIsHiddenConstraint?.isActive = false
        }

        if specificSubTopic.subTopics == nil {
            tableView?.isHidden = true
        }
    }

    @IBAction func sliderChangedValue(_ sender: UISlider) {
        let pHItemArray = ["Stomach Acid", "Lemonade", "Apple Juice", "Tomato Juice", "Coffee", "Milk", "Water", "Egg", "Baking Soda", "Stomach Tablets", "Ammonia (Cleaning Products)", "Soap", "Bleach", "Pipe Cleaner"]

        let line1Text = "Current pH: " + String(Int(sender.value.rounded()))
        let line2Text = "\n" + pHItemArray[Int(sender.value.rounded()) - 1]
        sliderValueLabel.text = line1Text + line2Text
        pHImageView.image = UIImage(named: "ph-" + String(sender.value.rounded()) + ".png")
    }

    func numberOfSections(in _: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        1
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if specificSubTopic.subTopics?.count != nil {
            return specificSubTopic.subTopics!.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subSubTopicCell", for: indexPath)

        if let cell = cell as? SubSubTopicTableViewCell {
            cell.subSubTopicPicture.image = UIImage(named: (specificSubTopic.subTopics?[indexPath.row].picture)!)
            cell.subSubTopicTitleLabel.text = specificSubTopic.subTopics?[indexPath.row].topic
        }

        return cell
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        80.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Change the selected background view of the cell.
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToSubSubTopic" {
            let dest = segue.destination as! LearnSubSubTopicDetailsViewController
            let indexPath = tableView.indexPathForSelectedRow!
            dest.flexibleTitle = specificSubTopic.subTopics?[indexPath.row].topic
            dest.specificChapter = specificSubTopic.subTopics?[indexPath.row]
            dest.subTopicName = specificSubTopic.navTitle
            let backItem = UIBarButtonItem()
            backItem.title = title
            navigationItem.backBarButtonItem = backItem
        }
    }
}
