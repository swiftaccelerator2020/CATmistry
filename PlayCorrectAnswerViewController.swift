//
//  PlayCorrectAnswerViewController.swift
//  CATmistry
//
//  Created by N HJ on 8/12/20.
//

import UIKit
import SwiftConfettiView

class PlayCorrectAnswerViewController: UIViewController {

    @IBOutlet weak var nextGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nextGameButton.layer.cornerRadius = 25
        
        let confettiView = SwiftConfettiView(frame: self.view.bounds)
        self.view.addSubview(confettiView)
        confettiView.startConfetti()
    }
    
    @IBAction func nextGameClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        print("answer correct well done now go back")
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
