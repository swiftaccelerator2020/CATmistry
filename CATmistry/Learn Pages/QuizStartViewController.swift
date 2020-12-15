//
//  QuizStartViewController.swift
//  CATmistry
//
//  Created by N HJ on 15/12/20.
//

import UIKit

class QuizStartViewController: UIViewController {
    
    var question: [QuizQuestion]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "startQuiz" {
            let destVC = segue.destination as! QuizViewController
            destVC.question = question
        }
    }
    

}
