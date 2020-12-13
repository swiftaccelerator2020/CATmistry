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
    
    var progressBarTimer: Timer!
    var index = 0
    var question = [QuizQuestion(question: "Hi there are you bob", options: ["hi", "yes", "aa", "no u"], correctAnswer: 1), QuizQuestion(question: "Hi theafsfasfsare are you bob", options: ["hi", "yes", "aa", "no u"], correctAnswer: 1)]
    
    var firstLoad = true
    
    override func viewDidLoad() {
        
        timeLeft.progress = 0
        
        optionOne.titleLabel!.text = question[index].options[0]
        
        optionTwo.titleLabel!.text = question[index].options[1]
        
        optionThree.titleLabel!.text = question[index].options[2]
        
        optionFour.titleLabel!.text = question[index].options[3]
        
        questionLabel.text = question[index].question
        
        self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.025, target: self, selector: #selector(QuizViewController.updateProgressView), userInfo: nil, repeats: true)

        timeLeft.transform = timeLeft.transform.scaledBy(x: 1, y: 2)
        

        
        firstLoad = false
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timeLeft.progress = 0
    
        if (index >= question.count-1){
            stopTimer()
            performSegue(withIdentifier: "quizEnded", sender: nil)
        }
        
        if !firstLoad{
            optionOne.titleLabel!.text = question[index].options[0]
        
            optionTwo.titleLabel!.text = question[index].options[1]
        
            optionThree.titleLabel!.text = question[index].options[2]
        
            optionFour.titleLabel!.text = question[index].options[3]
        
            questionLabel.text = question[index].question
        
            self.progressBarTimer = Timer.scheduledTimer(timeInterval: 0.025, target: self, selector: #selector(QuizViewController.updateProgressView), userInfo: nil, repeats: true)
        }
    }

    @IBAction func optionOneClicked(_ sender: Any) {
        stopTimer()
        if (question[index].correctAnswer == 1){
            performSegue(withIdentifier: "correctAns", sender: nil)
        }else{
            performSegue(withIdentifier: "wrongAns", sender: nil)
        }
        index += 1
    }
    
    @IBAction func optionTwoClicked(_ sender: Any) {
        stopTimer()
        if (question[index].correctAnswer == 2){
            performSegue(withIdentifier: "correctAns", sender: nil)
        }else{
            performSegue(withIdentifier: "wrongAns", sender: nil)
        }
        index += 1
    }
    
    @IBAction func optionThreeClicked(_ sender: Any) {
        stopTimer()
        if (question[index].correctAnswer == 3){
            performSegue(withIdentifier: "correctAns", sender: nil)
        }else{
            performSegue(withIdentifier: "wrongAns", sender: nil)
        }
        index += 1
    }
    
    @IBAction func optionFourClicked(_ sender: Any) {
        stopTimer()
        if (question[index].correctAnswer == 4){
            performSegue(withIdentifier: "correctAns", sender: nil)
        }else{
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
    @objc func updateProgressView(){
        timeLeft.progress += 0.005
        if(timeLeft.progress == 1.0)
        {
            stopTimer()
            timeLeft.progress = 0
            performSegue(withIdentifier: "wrongAns", sender: nil)
            index += 1
        }
    }
    
    func stopTimer(){
        progressBarTimer.invalidate()
        progressBarTimer = nil
        timeLeft.progress = 0
    }
}
