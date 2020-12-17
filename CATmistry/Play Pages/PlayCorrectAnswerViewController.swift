//
//  PlayCorrectAnswerViewController.swift
//  CATmistry
//
//  Created by N HJ on 8/12/20.
//

import UIKit
import SwiftConfettiView

class PlayCorrectAnswerViewController: UIViewController {

    var isSeperation: Bool?
    var currentLevel: Int!
    var currentGame: Int!
    var gameType: Int!

    @IBOutlet weak var nextGameButton: UIButton!
    @IBOutlet weak var congratsLabel: UILabel!
    @IBOutlet weak var goHomeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nextGameButton.layer.cornerRadius = 25
        if isSeperation != nil {
            congratsLabel.text = "Yay good job you saved the cat!"
            nextGameButton.setTitle("Go Back Home", for: .normal)
            goHomeButton.isHidden = true
            UserDefaults.incrementIntegerForKey(key: "gameTwoAttempts")
        } else {
            congratsLabel.text = "Congrats! \n\nThrough your hard work, your cat has been able to avoid the danger. \n\nYou have \(String(9 - currentGame)) rounds remaining in Level \(String(currentLevel + 1)). Keep up the good work!"
            if 9 - self.currentGame == 0 {
                nextGameButton.setTitle("Go Back Home", for: .normal)
                goHomeButton.isHidden = true
                if gameType == 1 {
                    UserDefaults.incrementIntegerForKey(key: "gameOneAttempts")
                } else if gameType == 3 {
                    UserDefaults.incrementIntegerForKey(key: "gameThreeAttempts")
                } else if gameType == 4 {
                    UserDefaults.incrementIntegerForKey(key: "gameFourAttempts")
                }
            }
        }
        let confettiView = SwiftConfettiView(frame: self.view.bounds)
        self.view.addSubview(confettiView)
        confettiView.isUserInteractionEnabled = false
        confettiView.startConfetti()
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
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
