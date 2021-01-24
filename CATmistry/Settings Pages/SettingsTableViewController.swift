//
//  SettingsTableViewController.swift
//  CATmistry
//
//  Created by N HJ on 12/12/20.
//

import UIKit

var quizOneAttempts = ud.integer(forKey: "quizOneAttempts")
var quizTwoAttempts = ud.integer(forKey: "quizTwoAttempts")
var quizThreeAttempts = ud.integer(forKey: "quizThreeAttempts")
var quizFourAttempts = ud.integer(forKey: "quizFourAttempts")
var gameOneAttempts = ud.integer(forKey: "gameOneAttempts")
var gameTwoAttempts = ud.integer(forKey: "gameTwoAttempts")
var gameThreeAttempts = ud.integer(forKey: "gameThreeAttempts")
var gameFourAttempts = ud.integer(forKey: "gameFourAttempts")

class SettingsTableViewController: UITableViewController {

    var settingsHeaderArray = [
        "Accessibility Settings",
        "Quiz Attempts",
        "Game Attempts",
//        "General Statistics",
//        "Find Gas Game",
//        "Retrieve Solids Game",
//        "Adjust pH Game",
//        "Identify Elements Game",
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
            /*
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
 */
        ],

        [
            SettingsContent(
                labelText: "Gas Tests: \(String(quizOneAttempts))",
                type: "detailAccessoryCell",
                emojiImage: "1️⃣"
            ),
            SettingsContent(
                labelText: "Separation Methods: \(String(quizTwoAttempts))",
                type: "detailAccessoryCell",
                emojiImage: "2️⃣"
            ),
            SettingsContent(
                labelText: "pH and Indicators: \(String(quizThreeAttempts))",
                type: "detailAccessoryCell",
                emojiImage: "3️⃣"
            ),
            SettingsContent(
                labelText: "Periodic Table: \(String(quizFourAttempts))",
                type: "detailAccessoryCell",
                emojiImage: "4️⃣"
            ),
        ],

        [
            SettingsContent(
                labelText: "Gas Tests: \(String(gameOneAttempts))",
                type: "detailAccessoryCell",
                emojiImage: "1️⃣"
            ),
            SettingsContent(
                labelText: "Separation Methods: \(String(gameTwoAttempts))",
                type: "detailAccessoryCell",
                emojiImage: "2️⃣"
            ),
            SettingsContent(
                labelText: "pH and Indicators: \(String(gameThreeAttempts))",
                type: "detailAccessoryCell",
                emojiImage: "3️⃣"
            ),
            SettingsContent(
                labelText: "Periodic Table: \(String(gameFourAttempts))",
                type: "detailAccessoryCell",
                emojiImage: "4️⃣"
            ),
        ],

//        [
//            SettingsContent(
//                labelText: "Chapters Covered:",
//                type: "detailAccessoryCell",
//                emojiImage: "📚"
//            ),
//            SettingsContent(
//                labelText: "Hours Spent Learning:",
//                type: "detailAccessoryCell",
//                emojiImage: "⏰"
//            ),
//        ],
//
//        [
//            SettingsContent(
//                labelText: "Number of Times Played: ",
//                type: "detailAccessoryCell",
//                emojiImage: "🎮"
//            ),
//            SettingsContent(
//                labelText: "High Score: ",
//                type: "disclosureIndicatorCell",
//                emojiImage: "🏅"
//            ),
//        ],
//
//        [
//            SettingsContent(
//                labelText: "Number of Times Played: ",
//                type: "detailAccessoryCell",
//                emojiImage: "🎮"
//            ),
//            SettingsContent(
//                labelText: "High Score: ",
//                type: "disclosureIndicatorCell",
//                emojiImage: "🏅"
//            ),
//        ],
//
//        [
//            SettingsContent(
//                labelText: "Number of Times Played: ",
//                type: "detailAccessoryCell",
//                emojiImage: "🎮"
//            ),
//            SettingsContent(
//                labelText: "High Score: ",
//                type: "disclosureIndicatorCell",
//                emojiImage: "🏅"
//            ),
//        ],
//
//        [
//            SettingsContent(
//                labelText: "Number of Times Played: ",
//                type: "detailAccessoryCell",
//                emojiImage: "🎮"
//            ),
//            SettingsContent(
//                labelText: "High Score: ",
//                type: "disclosureIndicatorCell",
//                emojiImage: "🏅"
//            ),
//        ],

        [
            SettingsContent(
                labelText: "The CATmistry Team: \nWang Zerui - CEO \nNeo Hao Jun - CTO \nChanel Tan - CDO \nRyu Hwina - CMO",
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

    override func viewDidAppear(_ animated: Bool) {
        quizOneAttempts = ud.integer(forKey: "quizOneAttempts")
        quizTwoAttempts = ud.integer(forKey: "quizTwoAttempts")
        quizThreeAttempts = ud.integer(forKey: "quizThreeAttempts")
        quizFourAttempts = ud.integer(forKey: "quizFourAttempts")
        gameOneAttempts = ud.integer(forKey: "gameOneAttempts")
        gameTwoAttempts = ud.integer(forKey: "gameTwoAttempts")
        gameThreeAttempts = ud.integer(forKey: "gameThreeAttempts")
        gameFourAttempts = ud.integer(forKey: "gameFourAttempts")
        tableView.reloadData()
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
            } else if cell.reuseIdentifier == "buttonCell" {
                cell.shareAction = {
                    let shareText = "CATmistry - Chemistry, Gamified - is a Chemistry learning app specifically designed for Upper Primary to Lower Secondary students. With many interactive learning elements and fun games, CATmistry is sure to provided a fun and engaging learning experience. \n\nFind us on the app store now: https:/"
                    let shareURL = NSURL(fileURLWithPath: "https://tk.sg/sis20-catmistry")
                    let vc = UIActivityViewController(activityItems: [shareText, shareURL], applicationActivities: [])
                    vc.modalPresentationStyle = .popover
                    self.present(vc, animated: true, completion: nil)
                }
            }
        }

        if cell.reuseIdentifier == "detailAccessoryCell" ||  cell.reuseIdentifier == "textCell" || cell.reuseIdentifier == "buttonCell"  {
            cell.selectionStyle = .none
        }
        
        if cell.reuseIdentifier == "switchCell" {
            if let cell = cell as? SettingsTableViewCell {
                cell.dyslexicSwitch.addTarget(self, action: #selector(zeruiToggled(_:)), for: .touchUpInside)
            }
            print("hi")
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
            return "© 2020, Neo Hao Jun & Wang Zerui"
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
    
    @objc func zeruiToggled(_ sender: UISwitch) {
        // when zerui state gets changed
        
        if isDyslexic {
            isDyslexic = false
            ud.setValue(false, forKey: "dyslexic")
            let alert = UIAlertController(title: "The app will need to restart.", message: "Restart Now?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { _ in
                fatalError()
            }))
            alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            isDyslexic = true
            ud.setValue(true, forKey: "dyslexic")
            let alert = UIAlertController(title: "The app will need to restart.", message: "Restart Now?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { _ in
                fatalError()
            }))
            alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
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

public extension String {
    func image(fontSize:CGFloat = 40, bgColor:UIColor = UIColor.clear, imageSize:CGSize? = nil) -> UIImage? {
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
