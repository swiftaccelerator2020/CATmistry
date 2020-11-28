//
//  learnPageTableViewController.swift
//  CATmistry
//
//  Created by Wang Zerui on 27/11/20.
//

import UIKit
var topics = [
    Topic(segueDesti: "TOBEFILLED", title: "Gas Tests", pic: "gas-tests.png", pointsNeeded: 0),
    Topic(segueDesti: "TOBEFILLED", title: "Separation Methods", pic: "separation-methods.png", pointsNeeded: 10),
    Topic(segueDesti: "TOBEFILLED", title: "pH and Indicators", pic: "pH-and-indicators.png", pointsNeeded: 20),
    Topic(segueDesti: "TOBEFILLED", title: "Periodic Table", pic: "periodic-table.png", pointsNeeded: 30)
]

let ud = UserDefaults.standard
var points = ud.integer(forKey: "points")

class LearnHomePageTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
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
        return topics.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "learnChapterCell", for: indexPath)
        let currentTopic = topics[indexPath.row]
        
        if let cell = cell as? LearnHomePageTableViewCell{
            if (points < currentTopic.pointsNeeded){
                cell.backgroundColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
                cell.selectionStyle = .none
                cell.learnChapterImageView?.image = UIImage(named: "lock.png")
            } else {
                cell.learnChapterImageView?.image = UIImage(named: currentTopic.pic)
            }
            cell.learnChapterLabel.text = currentTopic.title
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
