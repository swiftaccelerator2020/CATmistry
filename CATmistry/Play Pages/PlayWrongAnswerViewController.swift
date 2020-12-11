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

    @IBOutlet weak var nextGameButton: UIButton!
    @IBOutlet weak var sadLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nextGameButton.layer.cornerRadius = 25
        if (isSeperation != nil){
            sadLabel.text = "The wizard's beaker overflowed! Now your cat is under a spell...\nReview [Separation Methods] to save your cat. "
        } else {
            sadLabel.text = "Oh no! \n\nYour answer was wrong, and your cat died. \n\nDon't worry though, a cat has 9 lives, and you still have \(String(9 - currentGame)) rounds remaining in Level \(String(currentLevel + 1)). Good luck!"
        }
    }
    
    @IBAction func nextGameClicked(_ sender: Any) {
        if (isSeperation != nil){
            self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func restartClicked(_ sender: Any) {
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
