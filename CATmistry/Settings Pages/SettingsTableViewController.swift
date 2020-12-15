//
//  SettingsTableViewController.swift
//  CATmistry
//
//  Created by N HJ on 12/12/20.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    var settingsHeaderArray = [
        "Accessibility Settings",
        "General Statistics",
        "Find Gas Game",
        "Retrieve Solids Game",
        "Adjust pH Game",
        "Identify Elements Game",
        "Authors and Acknoledgements",
        ""
    ]

    var settingsContentArray = [
        [
            SettingsContent(
                labelText: "Dyslexic Text",
                type: "switchCell",
                emojiImage: "🅰️"
            ),
            SettingsContent(
                labelText: "Haptics",
                type: "switchCell",
                emojiImage: "📳"
            ),
            SettingsContent(
                labelText: "Dark Mode",
                type: "switchCell",
                emojiImage: "🌙"
            ),
        ],

        [
            SettingsContent(
                labelText: "Chapters Covered:",
                type: "detailAccessoryCell",
                emojiImage: "📚"
            ),
            SettingsContent(
                labelText: "Hours Spent Learning:",
                type: "detailAccessoryCell",
                emojiImage: "⏰"
            ),
        ],

        [
            SettingsContent(
                labelText: "Number of Times Played: ",
                type: "detailAccessoryCell",
                emojiImage: "🎮"
            ),
            SettingsContent(
                labelText: "High Score: ",
                type: "disclosureIndicatorCell",
                emojiImage: "🏅"
            ),
        ],

        [
            SettingsContent(
                labelText: "Number of Times Played: ",
                type: "detailAccessoryCell",
                emojiImage: "🎮"
            ),
            SettingsContent(
                labelText: "High Score: ",
                type: "disclosureIndicatorCell",
                emojiImage: "🏅"
            ),
        ],

        [
            SettingsContent(
                labelText: "Number of Times Played: ",
                type: "detailAccessoryCell",
                emojiImage: "🎮"
            ),
            SettingsContent(
                labelText: "High Score: ",
                type: "disclosureIndicatorCell",
                emojiImage: "🏅"
            ),
        ],

        [
            SettingsContent(
                labelText: "Number of Times Played: ",
                type: "detailAccessoryCell",
                emojiImage: "🎮"
            ),
            SettingsContent(
                labelText: "High Score: ",
                type: "disclosureIndicatorCell",
                emojiImage: "🏅"
            ),
        ],

        [
            SettingsContent(
                labelText: "The CATmistry Team: \nNeo Hao Jun - CEO \nWang Zerui - CTO \nChanel Tan - CDO \nRyu Hwina - CMO",
                type: "textCell",
                emojiImage: "👨‍🔬"
            ),
            SettingsContent(
                labelText: "This app would not have been possible without YJ Soon, Stephanie Ann Koh, and the entire Swift Accelerator 2020 Consult Team.",
                type: "textCell",
                emojiImage: "👨‍💻"
            ),
        ],

        [
            SettingsContent(
                labelText: "",
                type: "buttonCell",
                emojiImage: ""
            ),
        ],
    ]

    @IBOutlet var settingsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()

        let navbar = UINavigationBarAppearance()
        navbar.backgroundColor = UIColor(red: 196/255, green: 169/255, blue: 124/255, alpha: 1)
        self.navigationController?.navigationBar.scrollEdgeAppearance = navbar

        //        gamePointsLabel.text = " You have \(points) points"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func doneButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return settingsContentArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return settingsContentArray[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: settingsContentArray[indexPath.section][indexPath.row].type, for: indexPath)

        // Configure the cell...
        if let cell = cell as? SettingsTableViewCell {
            if cell.reuseIdentifier != "shareCell" && cell.reuseIdentifier != "buttonCell" {
                cell.contentLabel.text = settingsContentArray[indexPath.section][indexPath.row].labelText
                cell.settingsImageView.image = settingsContentArray[indexPath.section][indexPath.row].emojiImage.image()
            }
        }

        if cell.reuseIdentifier == "detailAccessoryCell" || cell.reuseIdentifier == "switchCell" || cell.reuseIdentifier == "textCell" || cell.reuseIdentifier == "buttonCell"  {
            cell.selectionStyle = .none
        }

        return cell
    }

    // Table Header
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        if settingsHeaderArray[section] != "" {
            return settingsHeaderArray[section]
        } else {
            return nil
        }
    }

    // Table Footer
    override func tableView(_ tableView: UITableView, titleForFooterInSection
                                section: Int) -> String? {
        if settingsHeaderArray[section] == "" {
            return "© 2020, Neo Hao Jun and Wang Zerui"
        } else {
            return nil
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if settingsContentArray[indexPath.section][indexPath.row].type  == "textCell" {
            return 150.0
        } else {
            return 45.0
        }
    }


    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */

    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */

    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

     }
     */

    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}

extension String
{
    func image(fontSize:CGFloat = 40, bgColor:UIColor = UIColor.clear, imageSize:CGSize? = nil) -> UIImage?
    {
        let font = UIFont.systemFont(ofSize: fontSize)
        let attributes = [NSAttributedString.Key.font: font]
        let imageSize = imageSize ?? self.size(withAttributes: attributes)

        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        bgColor.set()
        let rect = CGRect(origin: .zero, size: imageSize)
        UIRectFill(rect)
        self.draw(in: rect, withAttributes: [.font: font])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
