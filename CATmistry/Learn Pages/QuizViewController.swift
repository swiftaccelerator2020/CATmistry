//
//  QuizViewController.swift
//  CATmistry
//
//  Created by Wang Zerui on 29/11/20.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    @IBOutlet weak var optionFour: UIButton!
    @IBOutlet weak var timeLeft: UIProgressView!
    var progressBarTimer: Timer?

    var index = 0
    var question: [QuizQuestion]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timeLeft.transform = timeLeft.transform.scaledBy(x: 1, y: 2)

        optionOne.setTitle(question[index].options[0], for: .normal)
        optionTwo.setTitle(question[index].options[1], for: .normal)
        optionThree.setTitle(question[index].options[2], for: .normal)
        optionFour.setTitle(question[index].options[3], for: .normal)
        questionLabel.text = question[index].question

        optionOne.layer.cornerRadius = 15
        optionTwo.layer.cornerRadius = 15
        optionThree.layer.cornerRadius = 15
        optionFour.layer.cornerRadius = 15
    }

    override func viewDidAppear(_ animated: Bool) {
        timeLeft.progress = 0

        if (index >= question.count){
            stopTimer()
            performSegue(withIdentifier: "quizEnded", sender: nil)
        } else {

            optionOne.setTitle(question[index].options[0], for: .normal)

            optionTwo.setTitle(question[index].options[1], for: .normal)

            optionThree.setTitle(question[index].options[2], for: .normal)

            optionFour.setTitle(question[index].options[3], for: .normal)

            questionLabel.text = question[index].question

            self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.025, target: self, selector: #selector(QuizViewController.updateProgressView), userInfo: nil, repeats: true)

        }
    }

    @IBAction func optionOneClicked(_ sender: Any) {
        stopTimer()
        if (question[index].correctAnswer == 1) {
            performSegue(withIdentifier: "correctAns", sender: nil)
        } else {
            performSegue(withIdentifier: "wrongAns", sender: nil)
        }
        index += 1
    }

    @IBAction func optionTwoClicked(_ sender: Any) {
        stopTimer()
        if (question[index].correctAnswer == 2) {
            performSegue(withIdentifier: "correctAns", sender: nil)
        } else {
            performSegue(withIdentifier: "wrongAns", sender: nil)
        }
        index += 1
    }

    @IBAction func optionThreeClicked(_ sender: Any) {
        stopTimer()
        if (question[index].correctAnswer == 3) {
            performSegue(withIdentifier: "correctAns", sender: nil)
        } else {
            performSegue(withIdentifier: "wrongAns", sender: nil)
        }
        index += 1
    }

    @IBAction func optionFourClicked(_ sender: Any) {
        stopTimer()
        if (question[index].correctAnswer == 4) {
            performSegue(withIdentifier: "correctAns", sender: nil)
        } else {
            performSegue(withIdentifier: "wrongAns", sender: nil)
        }
        index += 1
    }

     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        if segue.identifier == "correctAns" {
            let destVC = segue.destination as! QuizCorrectAnswerViewController
            destVC.currentQuestion = index
        } else if segue.identifier == "wrongAns" {
            let destVC = segue.destination as! QuizWrongAnswerViewController
            destVC.currentQuestion = index
        }
     }


    @objc func updateProgressView(){
        timeLeft.progress += 0.005
        if (timeLeft.progress == 1.0) {
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
