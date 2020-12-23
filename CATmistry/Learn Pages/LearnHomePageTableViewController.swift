//
//  learnPageTableViewController.swift
//  CATmistry
//
//  Created by Wang Zerui on 27/11/20.
//

import UIKit
import FirebaseDatabase

let ud = UserDefaults.standard
var chOneDone = ud.bool(forKey: "chOneDone")
var chTwoDone = ud.bool(forKey: "chTwoDone")
var chThreeDone = ud.bool(forKey: "chThreeDone")
var chFourDone = ud.bool(forKey: "chFourDone")
var points = ud.integer(forKey: "points")

class LearnHomePageTableViewController: UITableViewController {
    var chapterApproved = [
        true,
        chOneDone,
        chTwoDone,
        chThreeDone,
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if let savedPerson = defaults.object(forKey: "learnTopics") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(Topic.self, from: savedPerson) {
                learnTopics = [loadedPerson]
            }
        }

        if let savedPerson = defaults.object(forKey: "gameTopics") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(PlayTopic.self, from: savedPerson) {
                gameTopics = [loadedPerson]
            }
        }

        if let savedPerson = defaults.object(forKey: "gameTopics") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(GasTestGame.self, from: savedPerson) {
                gasesArray = [loadedPerson]
            }
        }

        if let savedPerson = defaults.object(forKey: "phGameArray") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(PhGame.self, from: savedPerson) {
                phGameArray = [[loadedPerson]]
            }
        }

        if let savedPerson = defaults.object(forKey: "phGameOptionsArray") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(PhOption.self, from: savedPerson) {
                phGameOptionsArray = [loadedPerson]
            }
        }

        if let savedPerson = defaults.object(forKey: "periodicTable") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(PeriodicTableGame.self, from: savedPerson) {
                periodicTable = [[loadedPerson]]
            }
        }

        if let savedPerson = defaults.object(forKey: "retrieveSolidsArray") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(specificSeperationMethod.self, from: savedPerson) {
                print(loadedPerson)
                retrieveSolidsArray = [loadedPerson]
                print("Hello does this work")
            }
        }
        
        tableView.reloadData()
        
        var versionNumber: Int!
        // var currentVersionNumber: Int?
        
        // currentVersionNumber = defaults.integer(forKey: "versionNumber")
        let ref = Database.database().reference(withPath: "versionNumber")
        ref.keepSynced(true)
        ref.observe(.value, with: { (snapshot) in
            
            let data = snapshot.value
            versionNumber = data as? Int
            if true {
                loadData(versionNumber: versionNumber, tableView: self.tableView)
            }
        })
        
        
        tableView.tableFooterView = UIView()

        NotificationCenter.default.addObserver(self, selector: #selector(didUpdateUserDefaults), name: UserDefaults.didChangeNotification, object: nil)
        let navbar = UINavigationBarAppearance()
        navbar.backgroundColor = UIColor(red: 242/255, green: 214/255, blue: 112/255, alpha: 1)
        self.navigationController?.navigationBar.scrollEdgeAppearance = navbar

        tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewDidAppear(_ animated: Bool) {
        chTwoDone = ud.bool(forKey: "chTwoDone")
        chThreeDone = ud.bool(forKey: "chThreeDone")
        chFourDone = ud.bool(forKey: "chFourDone")
        chapterApproved = [
            true,
            chOneDone,
            chTwoDone,
            chThreeDone,
        ]
        tableView.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier:
                                                    "learnChapterCell", for: indexPath)
        let currentTopic = learnTopics[indexPath.row]

        if let cell = cell as? LearnHomePageTableViewCell{
            if chapterApproved[indexPath.row] == false {
                cell.selectionStyle = .none
                cell.learnChapterLabel.isEnabled = false
                cell.needMorePointsLabel?.isHidden = false
                cell.needMorePointsLabel?.text = currentTopic.errorLabel
                cell.learnChapterImageView?.image = UIImage(named: "lock.png")
            } else {
                cell.learnChapterImageView?.image = UIImage(named: currentTopic.pic)
                cell.learnChapterLabel.isEnabled = true
                cell.needMorePointsLabel?.isHidden = true


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
        if segue.identifier == "goToSubTopic" {
            let dest = segue.destination as! LearnChapterSubTopicsTableViewController
            let indexPath = tableView.indexPathForSelectedRow!
            dest.flexibleTitle = learnTopics[indexPath.row].title
            dest.specificChapter = learnTopics[indexPath.row].subTopics
            dest.quizTopic = learnTopics[indexPath.row].questions.shuffled()
            dest.currentTopicId = indexPath.row
        }
    }

    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        if let ident = identifier {
            if ident == "goToSubTopic" {
                let indexPath = tableView.indexPathForSelectedRow!
                if chapterApproved[indexPath.row] == false {
                    return false
                }
            }
        }
        return true
    }

    @objc func didUpdateUserDefaults() {
        chTwoDone = ud.bool(forKey: "chTwoDone")
        chThreeDone = ud.bool(forKey: "chThreeDone")
        chFourDone = ud.bool(forKey: "chFourDone")
        chapterApproved = [
            true,
            chOneDone,
            chTwoDone,
            chThreeDone,
        ]
    }
}
