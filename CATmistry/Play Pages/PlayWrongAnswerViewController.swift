//
//  PlayWrongAnswerViewController.swift
//  CATmistry
//
//  Created by N HJ on 8/12/20.
//

import UIKit

class PlayWrongAnswerViewController: UIViewController {
    
    var currentLevel: Int!
    var currentGame: Int!
    var isSeperation: Bool?
    var gameType: Int!
    
    @IBOutlet weak var nextGameButton: UIButton!
    @IBOutlet weak var goHomeButton: UIButton!
    @IBOutlet weak var sadLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        nextGameButton.layer.cornerRadius = 25
        if (isSeperation != nil){
            sadLabel.text = "The wizard's beaker overflowed! Now your cat is under a spell...\nReview [Separation Methods] to save your cat. "
            nextGameButton.setTitle("Go Back Home", for: .normal)
            goHomeButton.isHidden = true
            gameTwoAttempts += 1
            UserDefaults.incrementIntegerForKey(key: "gameTwoAttempts")
        } else {
            sadLabel.text = "Oh no! \n\nYour answer was wrong, and your cat died. \n\nDon't worry though, a cat has 9 lives, and you still have \(String(10 - currentGame)) rounds remaining in Level \(String(currentLevel)). Good luck!"
            if 9 - self.currentGame == 0 {
                nextGameButton.setTitle("Go Back Home", for: .normal)
                goHomeButton.isHidden = true
                if gameType == 1 {
                    gameOneAttempts += 1
                    UserDefaults.incrementIntegerForKey(key: "gameOneAttempts")
                } else if gameType == 3 {
                    gameThreeAttempts += 1
                    UserDefaults.incrementIntegerForKey(key: "gameThreeAttempts")
                } else if gameType == 4 {
                    gameFourAttempts += 1
                    UserDefaults.incrementIntegerForKey(key: "gameFourAttempts")
                }
            }
        }
    }
    
    @IBAction func nextGameClicked(_ sender: Any) {
        if (isSeperation != nil){
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        } else if 9 - currentGame == 0 {
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func restartClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure you would like to restart?", message: "All progress wil be lost, and you will be taken to the start page of this game.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: { action in
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
     //MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
