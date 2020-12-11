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

    @IBOutlet weak var nextGameButton: UIButton!
    @IBOutlet weak var congratsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nextGameButton.layer.cornerRadius = 25
        if (isSeperation != nil){
            congratsLabel.text = "Yay good job you saved the cat!"
        } else {
            congratsLabel.text = "Congrats! \n\nThrough your hard work, your cat has been able to avoid the danger. \n\nYou have \(String(9 - currentGame)) rounds remaining in Level \(String(currentLevel + 1)). Keep up the good work!"
        }

        let confettiView = SwiftConfettiView(frame: self.view.bounds)
        self.view.addSubview(confettiView)
        confettiView.isUserInteractionEnabled = false
        confettiView.startConfetti()
    }

    @IBAction func nextGameClicked(_ sender: Any) {
        if (isSeperation != nil){
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
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
