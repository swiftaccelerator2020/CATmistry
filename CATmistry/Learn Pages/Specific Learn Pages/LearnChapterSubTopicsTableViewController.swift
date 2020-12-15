//
//  SpecificContentTableViewController.swift
//  CATmistry
//
//  Created by Wang Zerui on 28/11/20.
//

import UIKit

class LearnChapterSubTopicsTableViewController: UITableViewController {
    
    var flexibleTitle: String!
    var specificChapter: [SubTopic]! 
    var quizTopic: [QuizQuestion]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        self.title = flexibleTitle
        
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        
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
        return specificChapter.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "learnChapterCell", for: indexPath)
        let currentSubTopic = specificChapter[indexPath.row]
        
        if let cell = cell as? LearnHomePageTableViewCell{
            cell.learnChapterImageView?.image = UIImage(named: currentSubTopic.pic)
            cell.learnChapterLabel.text = currentSubTopic.title
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
        if segue.identifier == "goToSubTopicDetails" {
            let dest = segue.destination as! LearnSubTopicDetailsViewController
            let indexPath = tableView.indexPathForSelectedRow!
            dest.specificSubTopic = specificChapter[indexPath.row]
            let backItem = UIBarButtonItem()
            backItem.title = self.title
            navigationItem.backBarButtonItem = backItem
            
        }
        
        if segue.identifier == "goToQuiz" {
            let destVC = segue.destination as! QuizViewController
            destVC.question = quizTopic
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (specificChapter[indexPath.row].title != "Take the Quiz"){
            performSegue(withIdentifier: "goToSubTopicDetails", sender: nil)
        } else {
            performSegue(withIdentifier: "goToQuiz", sender: nil)
        }
    }
}
