//
//  QuizCorrectAnswerViewController.swift
//  CATmistry
//
//  Created by N HJ on 15/12/20.
//

import SwiftConfettiView
import UIKit

class QuizCorrectAnswerViewController: UIViewController {

    var currentQuestion: Int!
    var correctAnswers: Int!
    var wrongAnswers: Int!
    var currentTopicId: Int!

    var chapterCompletedUserDefaultsArray = [
        chOneDone,
        chTwoDone,
        chThreeDone,
        chFourDone
    ]
    var chapterCompletedStringsUserDefaultsArray = [
        "chOneDone",
        "chTwoDone",
        "chThreeDone",
        "chFourDone"
    ]
    var quizAttemptsUserDefaultArray = [
        quizOneAttempts,
        quizTwoAttempts,
        quizThreeAttempts,
        quizFourAttempts
    ]
    var quizAttemptsStringsUserDefaultArray = [
        "quizOneAttempts",
        "quizTwoAttempts",
        "quizThreeAttempts",
        "quizFourAttempts"
    ]

    @IBOutlet var nextQuestionButton: UIButton!
    @IBOutlet var congratsLabel: UILabel!
    @IBOutlet var goBackLearningButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nextQuestionButton.layer.cornerRadius = 25
        if 9 - currentQuestion == 0 {
            if correctAnswers >= 7 {
                congratsLabel.text = "Well done! You got the answer right. \n\nThe quiz has to an end, and you got \(String(correctAnswers)) of 10 questions right. Excellent!"
                ud.set(true, forKey: chapterCompletedStringsUserDefaultsArray[currentTopicId])
                chapterCompletedUserDefaultsArray[currentTopicId] = true
                UserDefaults.incrementIntegerForKey(key: quizAttemptsStringsUserDefaultArray[currentTopicId])
                quizAttemptsUserDefaultArray[currentTopicId] += 1
                UserDefaults.standard.synchronize()

            } else {
                congratsLabel.text = "Well done! You got the answer right. \n\nHowever, you only scored \(String(correctAnswers)) out of 10 in this quiz. You need at least 7 out of 10 to pass. Try harder next time!"
            }
        } else {
            congratsLabel.text = "Well done! You got the answer right. \n\nYou have \(String(9 - currentQuestion)) questions left in this quiz, keep up the good work!"
        }

        if 9 - currentQuestion == 0 {
            goBackLearningButton.isHidden = true
            nextQuestionButton.setTitle("Go Back Home", for: .normal)
        }

        let confettiView = SwiftConfettiView(frame: view.bounds)
        view.addSubview(confettiView)
        confettiView.isUserInteractionEnabled = false
        confettiView.startConfetti()
    }

    @IBAction func nextGameClicked(_: Any) {
        if 9 - currentQuestion == 0 {
            presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func restartClicked(_: Any) {
        let alert = UIAlertController(title: "Are you sure you would like to exit?", message: "All progress wil be lost, and you will be taken back to the learn page.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: { _ in
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
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

public extension UserDefaults {
    class func incrementIntegerForKey(key:String) {
        let defaults = standard
        let int = defaults.integer(forKey: key)
        defaults.set(int+1, forKey:key)
    }
}
