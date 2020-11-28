//
//  learnPageTableViewController.swift
//  CATmistry
//
//  Created by Wang Zerui on 27/11/20.
//

import UIKit
var learnTopics = [
    Topic(title: "Gas Tests", pic: "gas-tests.png", pointsNeeded: 0, subTopics: [
        SubTopic(title: "What are Gas Tests?", pic: "gas-tests.png", id: 1, content:
            SubContent(definition: ""),
        subTopics: nil),
        SubTopic(title: "Take the Quiz", pic: "quiz.png", id: 5, content: SubContent(definition: ""), subTopics: [])
    ]),
    
    Topic(title: "Separation Methods", pic: "separation-methods.png", pointsNeeded: 10, subTopics: [
        SubTopic(title: "What is Separation?", pic: "separation-methods.png", id: 1, content: SubContent(definition: "A separation process is a method that converts a mixture or solution of chemical substances into two or more distinct product mixtures. \n\nSeparations exploit differences in chemical properties or physical properties (such as size, shape, mass, density, or chemical affinity) between the constituents of a mixture."), subTopics: []),
        SubTopic(title: "Take the Quiz", pic: "quiz.png", id: 2, content: SubContent(definition: ""), subTopics: [])
    ]),
    
    Topic(title: "pH and Indicators", pic: "pH-and-indicators.png", pointsNeeded: 20, subTopics: [
        SubTopic(title: "What is pH?", pic: "pH-and-indicators.png", id: 1, content: SubContent(definition: "pH (the Power of Hydrogen) is a scale of 1 to 14 used to specify the acidity or basicity of a solution. The pH scale indicates the concentration of hydrogen ions in a solution.\n\nA lower pH (1 - 6.9) indicates that the solution is acidic, while a higher pH (7.1 - 14) indicates that the solution is alkaline. A pH of 7 indicates that the solution is neutral (neither acidic nor alkaline)."), subTopics: []),
        SubTopic(title: "What are Indicators?", pic: "pH-and-indicators.png", id: 2, content: SubContent(definition: "Indicators are chemicals which turn into different colours depending on the pH of the solution. The transition range is the range in which the indicator changes from one colour to the other."), subTopics: []),
        SubTopic(title: "Take the Quiz", pic: "quiz.png", id: 3, content: SubContent(definition: ""), subTopics: [])
    ]),
    
    Topic(title: "Periodic Table", pic: "periodic-table.png", pointsNeeded: 30, subTopics: [
        SubTopic(title: "What is the Periodic Table?", pic: "periodic-table.png", id: 1, content: SubContent(definition: "A periodic table is a chart that shows chemical elements in order of their atomic number. \n\nElements with similar properties are arranged in the same column (group), and elements with the same number of electron shells are arranged in the same row (period)."), subTopics: []),
        SubTopic(title: "What are Elements?", pic: "periodic-table.png", id: 2, content: SubContent(definition: ""), subTopics: []),
        SubTopic(title: "First 18 Elements", pic: "periodic-table.png", id: 3, content: SubContent(definition: ""), subTopics: []),
        SubTopic(title: "Take the Quiz", pic: "quiz.png", id: 4, content: SubContent(definition: ""), subTopics: [])
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
//            if (points < currentTopic.pointsNeeded){
//                cell.backgroundColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
//                cell.selectionStyle = .none
//                cell.learnChapterImageView?.image = UIImage(named: "lock.png")
//            } else {
                cell.learnChapterImageView?.image = UIImage(named: currentTopic.pic)
//            }
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
        if segue.identifier == "goToSubTopic" {
            let dest = segue.destination as! LearnChapterSubTopicsTableViewController
            let indexPath = tableView.indexPathForSelectedRow!
            dest.flexibleTitle = learnTopics[indexPath.row].title
            dest.specificChapter = learnTopics[indexPath.row].subTopics
        }
    }
    
    
}
