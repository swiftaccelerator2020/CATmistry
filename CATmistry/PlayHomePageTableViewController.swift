//
//  PlayHomePageTableViewController.swift
//  CATmistry
//
//  Created by N HJ on 27/11/20.
//

import UIKit

var gameTopics = [
    Topic(title: "Diffusion", pic: "gas-tests.png", pointsNeeded: 0, topics: []),
    Topic(title: "Retreive the solids", pic: "separation-methods.png", pointsNeeded: 10, topics: []),
    Topic(title: "Get the PH Right", pic: "pH-and-indicators.png", pointsNeeded: 20, topics: []),
    Topic(title: "Identify the elements", pic: "periodic-table.png", pointsNeeded: 3, topics: []),
]

class PlayHomePageTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gameTopics.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playChapterCell", for: indexPath)
        let currentTopic = learnTopics[indexPath.row]
        
        if let cell = cell as? PlayHomePageTableViewCell{
            if (points < currentTopic.pointsNeeded){
                cell.backgroundColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
                cell.selectionStyle = .none
                cell.playChapterImageView?.image = UIImage(named: "lock.png")
            } else {
                cell.playChapterImageView?.image = UIImage(named: currentTopic.pic)
            }
            cell.playChapterLabel.text = currentTopic.title
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80.0
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
