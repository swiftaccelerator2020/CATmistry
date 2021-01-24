//
//  QuizStartViewController.swift
//  CATmistry
//
//  Created by N HJ on 15/12/20.
//

import SwiftConfettiView
import UIKit

class QuizStartViewController: UIViewController {

    var question: [QuizQuestion]!
    var currentTopicId: Int!

    @IBOutlet weak var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabBarController?.tabBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        startButton.layer.cornerRadius = 15

        let confettiView = SwiftConfettiView(frame: view.bounds)
        view.addSubview(confettiView)
        confettiView.isUserInteractionEnabled = false
        confettiView.startConfetti()
    }

    @IBAction func goBackPressed(_ sender: Any) {
        tabBarController?.tabBar.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.popViewController(animated: true)
    }


    @IBAction func openDeveloperCenter(_ sender: Any) {
        let ac = UIAlertController(title: "Enter developer panel code", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            self.performSegueIfPossible(id: answer.text)
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        ac.addAction(submitAction)
        ac.addAction(cancelAction)
        
        present(ac, animated: true)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "startQuiz" {
            let destVC = segue.destination as! QuizViewController
            destVC.question = question
            destVC.currentTopicId = currentTopicId
        }
    }


}
