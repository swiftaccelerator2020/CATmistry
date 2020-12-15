//
//  IdentifyElementsSecondPageOfGameViewController.swift
//  CATmistry
//
//  Created by Wang Zerui on 2/12/20.
//

import UIKit

class PlayIdentifyElementsSecondViewController: UIViewController {

    var currentLevel = 0

    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var nonMetal: UIButton!
    @IBOutlet weak var transitionMetal: UIButton!
    @IBOutlet weak var metal: UIButton!
    @IBOutlet weak var groupFour: UIButton!
    @IBOutlet weak var groupThree: UIButton!
    @IBOutlet weak var groupTwo: UIButton!
    @IBOutlet weak var groupOne: UIButton!
    @IBOutlet weak var timeLeft: UILabel!
    var currentRound = 0

    var progressBarTimer: Timer!
    var gameTopic: periodicTableGame!
    var timeLeftTrack: Int!
    var level: Int!

    let color = UIColor(red: 245/255.0, green: 214/255.0, blue: 224/255.0, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        timeLeftTrack = gameTopic.timeGiven

        timeLeft.text = "\(timeLeftTrack!) seconds left"

        desc.text = gameTopic.properties

        timeLeft.layer.masksToBounds = true
        timeLeft.layer.cornerRadius = 20
        groupOne.clipsToBounds = true
        groupOne.layer.cornerRadius = 0.5 * groupOne.bounds.size.height

        groupTwo.clipsToBounds = true
        groupTwo.layer.cornerRadius = 0.5 * groupTwo.bounds.size.height

        groupThree.clipsToBounds = true
        groupThree.layer.cornerRadius = 0.5 * groupThree.bounds.size.height

        groupFour.clipsToBounds = true
        groupFour.layer.cornerRadius = 0.5 * groupFour.bounds.size.height

        metal.clipsToBounds = true
        metal.layer.cornerRadius = 0.5 * metal.bounds.size.height

        transitionMetal.clipsToBounds = true
        transitionMetal.layer.cornerRadius = 0.5 * transitionMetal.bounds.size.height

        nonMetal.clipsToBounds = true
        nonMetal.layer.cornerRadius = 0.5 * nonMetal.bounds.size.height

        self.progressBarTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(PlayIdentifyElementsSecondViewController.updateProgressView), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        currentRound += 1
    }

    var selectedButton: UIButton!
    var selectedMetalButton: UIButton!

    @IBAction func groupOne(_ sender: Any) {
        if (selectedButton != groupOne && selectedButton != nil){
            groupOne.backgroundColor = .green
            groupOne.setTitleColor(.black, for: .normal)
            selectedButton.backgroundColor = .white
            selectedButton.setTitleColor(.black, for: .normal)
            selectedButton = groupOne
        } else if (selectedButton != groupOne){
            selectedButton = groupOne
            groupOne.backgroundColor = .green
            groupOne.setTitleColor(.black, for: .normal)
        } else {
            selectedButton = nil
            groupOne.backgroundColor = .white
            groupOne.setTitleColor(.black, for: .normal)
        }
    }

    @IBAction func groupTwo(_ sender: Any) {
        if (selectedButton != groupTwo && selectedButton != nil){
            groupTwo.backgroundColor = .green
            groupTwo.setTitleColor(.black, for: .normal)
            selectedButton.backgroundColor = .white
            selectedButton.setTitleColor(.black, for: .normal)
            selectedButton = groupTwo
        } else if (selectedButton != groupTwo){
            selectedButton = groupTwo
            groupTwo.backgroundColor = .green
            groupTwo.setTitleColor(.black, for: .normal)
        } else {
            selectedButton = nil
            groupTwo.backgroundColor = .white
            groupTwo.setTitleColor(.black, for: .normal)
        }
    }

    @IBAction func groupThree(_ sender: Any) {
        if (selectedButton != groupThree && selectedButton != nil){
            groupThree.backgroundColor = .green
            groupThree.setTitleColor(.black, for: .normal)
            selectedButton.backgroundColor = .white
            selectedButton.setTitleColor(.black, for: .normal)
            selectedButton = groupThree
        } else if (selectedButton != groupThree){
            selectedButton = groupThree
            groupThree.backgroundColor = .green
            groupThree.setTitleColor(.black, for: .normal)
        } else {
            selectedButton = nil
            groupThree.backgroundColor = .white
            groupThree.setTitleColor(.black, for: .normal)
        }
    }

    @IBAction func groupFour(_ sender: Any) {
        if (selectedButton != groupFour && selectedButton != nil){
            groupFour.backgroundColor = .green
            groupFour.setTitleColor(.black, for: .normal)
            selectedButton.backgroundColor = .white
            selectedButton.setTitleColor(.black, for: .normal)
            selectedButton = groupFour
        } else if (selectedButton != groupFour){
            selectedButton = groupFour
            groupFour.backgroundColor = .green
            groupFour.setTitleColor(.black, for: .normal)
        } else {
            selectedButton = nil
            groupFour.backgroundColor = .white
            groupFour.setTitleColor(.black, for: .normal)
        }
    }

    @IBAction func metal(_ sender: Any) {
        if (selectedMetalButton != metal && selectedMetalButton != nil){
            metal.backgroundColor = .green
            metal.setTitleColor(.black, for: .normal)
            selectedMetalButton.backgroundColor = color
            selectedMetalButton.setTitleColor(.black, for: .normal)
            selectedMetalButton = metal
        } else if (selectedMetalButton != metal){
            selectedMetalButton = metal
            metal.backgroundColor = .green
            metal.setTitleColor(.black, for: .normal)
        } else {
            selectedMetalButton = nil
            metal.backgroundColor = color
            metal.setTitleColor(.black, for: .normal)
        }
    }

    @IBAction func transitionMetal(_ sender: Any) {
        if (selectedMetalButton != transitionMetal && selectedMetalButton != nil){
            transitionMetal.backgroundColor = .green
            transitionMetal.setTitleColor(.black, for: .normal)
            selectedMetalButton.backgroundColor = color
            selectedMetalButton.setTitleColor(.black, for: .normal)
            selectedMetalButton = transitionMetal
        } else if (selectedMetalButton != transitionMetal){
            selectedMetalButton = transitionMetal
            transitionMetal.backgroundColor = .green
            transitionMetal.setTitleColor(.black, for: .normal)
        } else {
            selectedMetalButton = nil
            transitionMetal.backgroundColor = color
            transitionMetal.setTitleColor(.black, for: .normal)
        }
    }

    @IBAction func nonMetal(_ sender: Any) {
        if (selectedMetalButton != nonMetal && selectedMetalButton != nil){
            nonMetal.backgroundColor = .green
            nonMetal.setTitleColor(.black, for: .normal)
            selectedMetalButton.backgroundColor = color
            selectedMetalButton.setTitleColor(.black, for: .normal)
            selectedMetalButton = nonMetal
        } else if (selectedMetalButton != nonMetal){
            selectedMetalButton = nonMetal
            nonMetal.backgroundColor = .green
            nonMetal.setTitleColor(.black, for: .normal)
        } else {
            selectedMetalButton = nil
            nonMetal.backgroundColor = color
            nonMetal.setTitleColor(.black, for: .normal)
        }
    }

    @objc func updateProgressView(){
        timeLeft.text = "\(timeLeftTrack!) seconds left"
        timeLeftTrack -= 1
        if(timeLeftTrack == 0)
        {
            progressBarTimer.invalidate()
            progressBarTimer = nil

            var isCorrect = false
            var isCorrect2 = false
            switch selectedButton {
            case groupOne:
                if gameTopic.correctAns1 == 1{
                    points += level/2
                    isCorrect = true
                }
            case groupTwo:
                if gameTopic.correctAns1 == 2{
                    points += level/2
                    isCorrect = true
                }
            case groupThree:
                if gameTopic.correctAns1 == 3{
                    points += level/2
                    isCorrect = true
                }
            case groupFour:
                if gameTopic.correctAns1 == 4{
                    points += level/2
                    isCorrect = true
                }
            default:
                break
            }

            switch selectedMetalButton {
            case metal:
                if gameTopic.correctAns2 == 1{
                    points += level/2
                    isCorrect2 = true
                }
            case transitionMetal:
                if gameTopic.correctAns2 == 2{
                    points += level/2
                    isCorrect2 = true
                }
            case nonMetal:
                if gameTopic.correctAns2 == 3{
                    points += level/2
                    isCorrect2 = true
                }
            default:
                break
            }

            if (isCorrect && isCorrect2){
                performSegue(withIdentifier: "identifyElementsGameWIn", sender: nil)
            } else {
                performSegue(withIdentifier: "identifyElementsGameLose", sender: nil)
            }

            let ud = UserDefaults.standard
            ud.set(points, forKey: "points")
        }
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "identifyElementsGameWIn" {
            let destVC = segue.destination as! PlayCorrectAnswerViewController
            destVC.currentLevel = currentLevel+1
            destVC.currentGame = currentRound
        } else if segue.identifier == "identifyElementsGameLose" {
            let destVC = segue.destination as! PlayWrongAnswerViewController
            destVC.currentLevel = currentLevel+1
            destVC.currentGame = currentRound
        }
    }
}
