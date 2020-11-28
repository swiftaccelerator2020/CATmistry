//
//  learnPageTableViewController.swift
//  CATmistry
//
//  Created by Wang Zerui on 27/11/20.
//

import UIKit
var learnTopics = [
    Topic(title: "Gas Tests", pic: "gas-tests.png", pointsNeeded: 0, subTopics: [
        SubTopic(topic: "What are Gas Tests?", picture: "pic.png", id: 1, content: "NO", subTopics: <#[SubSubTopic]#>),
        SubTopic(topic: "Test for H₂", picture: "pic.png", id: 2, content: "NO", subTopics: <#[SubSubTopic]#>),
        SubTopic(topic: "Test for CO₂", picture: "pic.png", id: 3, content: "NO", subTopics: <#[SubSubTopic]#>),
        SubTopic(topic: "Test for NH₃", picture: "pic.png", id: 4, content: "NO", subTopics: <#[SubSubTopic]#>),
        SubTopic(topic: "Take the Quiz", picture: "pic.png", id: 5, content: "NO", subTopics: <#[SubSubTopic]#>)
    ]),
    
    Topic(title: "Separation Methods", pic: "separation-methods.png", pointsNeeded: 10, subTopics: [
        SubTopic(topic: "What is Separation?", picture: "pic.png", id: 1, content: "NO", subTopics: <#[SubSubTopic]#>),
        SubTopic(topic: "Take the Quiz", picture: "pic.png", id: 2, content: "NO", subTopics: <#[SubSubTopic]#>)
    ]),
    
    Topic(title: "pH and Indicators", pic: "pH-and-indicators.png", pointsNeeded: 20, subTopics: [
        SubTopic(topic: "What is pH?", picture: "pic.png", id: 1, content: "NO", subTopics: <#[SubSubTopic]#>),
        SubTopic(topic: "What are Indicators?", picture: "pic.png", id: 2, content: "NO", subTopics: <#[SubSubTopic]#>),
        SubTopic(topic: "Take the Quiz", picture: "pic.png", id: 3, content: "NO", subTopics: <#[SubSubTopic]#>),
    ]),
    
    Topic(title: "Periodic Table", pic: "periodic-table.png", pointsNeeded: 30, subTopics: [
        SubTopic(topic: "What is the Periodic Table?", picture: "pic.png", id: 1, content: "NO", subTopics: <#[SubSubTopic]#>),
        SubTopic(topic: "What are Elements?", picture: "pic.png", id: 2, content: "NO", subTopics: <#[SubSubTopic]#>),
        SubTopic(topic: "First 18 Elements", picture: "pic.png", id: 3, content: "NO", subTopics: <#[SubSubTopic]#>),
        SubTopic(topic: "Take the Quiz", picture: "pic.png", id: 4, content: "NO", subTopics: <#[SubSubTopic]#>)
    ]),
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
        return learnTopics.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "learnChapterCell", for: indexPath)
        let currentTopic = learnTopics[indexPath.row]
        
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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToSubTopic", let dest = segue.destination as? LearnChapterSubTopicsTableViewController, let cDc = tableView.indexPathForSelectedRow{
            dest.specificChapter = learnTopics[cDc.row].subTopics
        }
    }
    
    
}
