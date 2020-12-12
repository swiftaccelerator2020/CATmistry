//
//  SettingsTableViewController.swift
//  CATmistry
//
//  Created by N HJ on 12/12/20.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    var settingsContentArray = [
        [
            SettingsContent(
                labelText: "General Statistics",
                type: "headerCell"
            ),
            SettingsContent(
                labelText: "Chapters Covered:",
                type: "detailAccessoryCell"
            ),
            SettingsContent(
                labelText: "Game Points Earned: ",
                type: "detailAccessoryCell"
            ),
        ],
        
        [
            SettingsContent(
                labelText: "General Statistics",
                type: "headerCell"
            ),
            SettingsContent(
                labelText: "Chapters covered:",
                type: "detailAccessoryCell"
            ),
        ],
        
        [
            SettingsContent(
                labelText: "Stats for Find Gas Game",
                type: "headerCell"
            ),
            SettingsContent(
                labelText: "Number of Times Played: ",
                type: "detailAccessoryCell"
            ),
        ],
        
        [
            SettingsContent(
                labelText: "Stats for Retrieve Solids Game",
                type: "headerCell"
            ),
            SettingsContent(
                labelText: "Number of Times Played: ",
                type: "detailAccessoryCell"
            ),
        ],
        
        [
            SettingsContent(
                labelText: "Stats for Adjust pH Game",
                type: "headerCell"
            ),
            SettingsContent(
                labelText: "Number of Times Played: ",
                type: "detailAccessoryCell"
            ),
        ],
        
        [
            SettingsContent(
                labelText: "Stats for Identify Elements Game",
                type: "headerCell"
            ),
            SettingsContent(
                labelText: "Number of Times Played: ",
                type: "detailAccessoryCell"
            ),
        ],
        
        [
            SettingsContent(
                labelText: "Accessibility",
                type: "headerCell"
            ),
            SettingsContent(
                labelText: "Dyslexic Text",
                type: "switchCell"
            ),
            SettingsContent(
                labelText: "Dark Mode",
                type: "switchCell"
            ),
        ],


    ]

    @IBOutlet var settingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        let navbar = UINavigationBarAppearance()
        navbar.backgroundColor = UIColor(red: 198/255, green: 170/255, blue: 127/255, alpha: 1)
        self.navigationController?.navigationBar.scrollEdgeAppearance = navbar
        
        let topInset = 30
        settingsTableView.contentInset.top = CGFloat(topInset)
        
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
            cell.contentLabel.text = settingsContentArray[indexPath.section][indexPath.row].labelText
        }
        
        return cell
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