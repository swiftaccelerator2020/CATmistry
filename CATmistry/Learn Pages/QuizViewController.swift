//
//  QuizViewController.swift
//  CATmistry
//
//  Created by Wang Zerui on 29/11/20.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var optionOne: UIButton!
    @IBOutlet var optionTwo: UIButton!
    @IBOutlet var optionThree: UIButton!
    @IBOutlet var optionFour: UIButton!
    @IBOutlet var timeLeft: UIProgressView!
    var progressBarTimer: Timer?

    var index = 0
    var question: [QuizQuestion]!

    override func viewDidLoad() {
        timeLeft.transform = timeLeft.transform.scaledBy(x: 1, y: 2)

        optionOne.setTitle(question[index].options[0], for: .normal)

        optionTwo.setTitle(question[index].options[1], for: .normal)

        optionThree.setTitle(question[index].options[2], for: .normal)

        optionFour.setTitle(question[index].options[3], for: .normal)

        questionLabel.text = question[index].question

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_: Bool) {
        timeLeft.progress = 0

        if index >= question.count {
            stopTimer()
            performSegue(withIdentifier: "quizEnded", sender: nil)
        } else {
            optionOne.setTitle(question[index].options[0], for: .normal)

            optionTwo.setTitle(question[index].options[1], for: .normal)

            optionThree.setTitle(question[index].options[2], for: .normal)

            optionFour.setTitle(question[index].options[3], for: .normal)

            questionLabel.text = question[index].question

            progressBarTimer = Timer.scheduledTimer(timeInterval: 0.025, target: self, selector: #selector(QuizViewController.updateProgressView), userInfo: nil, repeats: true)
        }
    }

    @IBAction func optionOneClicked(_: Any) {
        stopTimer()
        if question[index].correctAnswer == 1 {
            performSegue(withIdentifier: "correctAns", sender: nil)
        } else {
            performSegue(withIdentifier: "wrongAns", sender: nil)
        }
        index += 1
    }

    @IBAction func optionTwoClicked(_: Any) {
        stopTimer()
        if question[index].correctAnswer == 2 {
            performSegue(withIdentifier: "correctAns", sender: nil)
        } else {
            performSegue(withIdentifier: "wrongAns", sender: nil)
        }
        index += 1
    }

    @IBAction func optionThreeClicked(_: Any) {
        stopTimer()
        if question[index].correctAnswer == 3 {
            performSegue(withIdentifier: "correctAns", sender: nil)
        } else {
            performSegue(withIdentifier: "wrongAns", sender: nil)
        }
        index += 1
    }

    @IBAction func optionFourClicked(_: Any) {
        stopTimer()
        if question[index].correctAnswer == 4 {
            performSegue(withIdentifier: "correctAns", sender: nil)
        } else {
            performSegue(withIdentifier: "wrongAns", sender: nil)
        }
        index += 1
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @objc func updateProgressView() {
        timeLeft.progress += 0.005
        if timeLeft.progress == 1.0 {
            stopTimer()
            performSegue(withIdentifier: "wrongAns", sender: nil)
            index += 1
        }
    }

    func stopTimer() {
        progressBarTimer?.invalidate()
        progressBarTimer = nil
        timeLeft.progress = 0
    }
}
