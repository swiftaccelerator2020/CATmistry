//
//  IdentifyElementsSecondPageOfGameViewController.swift
//  CATmistry
//
//  Created by Wang Zerui on 2/12/20.
//

import UIKit

class PlayIdentifyElementsSecondViewController: UIViewController {
    var currentLevel = 0

    @IBOutlet var desc: UILabel!
    @IBOutlet var nonMetal: UIButton!
    @IBOutlet var transitionMetal: UIButton!
    @IBOutlet var metal: UIButton!
    @IBOutlet var groupFour: UIButton!
    @IBOutlet var groupThree: UIButton!
    @IBOutlet var groupTwo: UIButton!
    @IBOutlet var groupOne: UIButton!
    @IBOutlet var timeLeft: UILabel!
    var currentRound = 0

    var progressBarTimer: Timer!
    var gameTopic: PeriodicTableGame!
    var timeLeftTrack: Int!
    var level: Int!

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

        progressBarTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(PlayIdentifyElementsSecondViewController.updateProgressView), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_: Bool) {
        currentRound += 1
    }

    var selectedButton: UIButton!
    var selectedMetalButton: UIButton!

    @IBAction func groupOne(_: Any) {
        if selectedButton != groupOne, selectedButton != nil {
            groupOne.backgroundColor = .green
            groupOne.setTitleColor(.black, for: .normal)
            selectedButton.backgroundColor = .black
            selectedButton.setTitleColor(.white, for: .normal)
            selectedButton = groupOne
        } else if selectedButton != groupOne {
            selectedButton = groupOne
            groupOne.backgroundColor = .green
            groupOne.setTitleColor(.black, for: .normal)
        } else {
            selectedButton = nil
            groupOne.backgroundColor = .black
            groupOne.setTitleColor(.white, for: .normal)
        }
    }

    @IBAction func groupTwo(_: Any) {
        if selectedButton != groupTwo, selectedButton != nil {
            groupTwo.backgroundColor = .green
            groupTwo.setTitleColor(.black, for: .normal)
            selectedButton.backgroundColor = .black
            selectedButton.setTitleColor(.white, for: .normal)
            selectedButton = groupTwo
        } else if selectedButton != groupTwo {
            selectedButton = groupTwo
            groupTwo.backgroundColor = .green
            groupTwo.setTitleColor(.black, for: .normal)
        } else {
            selectedButton = nil
            groupTwo.backgroundColor = .black
            groupTwo.setTitleColor(.white, for: .normal)
        }
    }

    @IBAction func groupThree(_: Any) {
        if selectedButton != groupThree, selectedButton != nil {
            groupThree.backgroundColor = .green
            groupThree.setTitleColor(.black, for: .normal)
            selectedButton.backgroundColor = .black
            selectedButton.setTitleColor(.white, for: .normal)
            selectedButton = groupThree
        } else if selectedButton != groupThree {
            selectedButton = groupThree
            groupThree.backgroundColor = .green
            groupThree.setTitleColor(.black, for: .normal)
        } else {
            selectedButton = nil
            groupThree.backgroundColor = .black
            groupThree.setTitleColor(.white, for: .normal)
        }
    }

    @IBAction func groupFour(_: Any) {
        if selectedButton != groupFour, selectedButton != nil {
            groupFour.backgroundColor = .green
            groupFour.setTitleColor(.black, for: .normal)
            selectedButton.backgroundColor = .black
            selectedButton.setTitleColor(.white, for: .normal)
            selectedButton = groupFour
        } else if selectedButton != groupFour {
            selectedButton = groupFour
            groupFour.backgroundColor = .green
            groupFour.setTitleColor(.black, for: .normal)
        } else {
            selectedButton = nil
            groupFour.backgroundColor = .black
            groupFour.setTitleColor(.white, for: .normal)
        }
    }

    @IBAction func metal(_: Any) {
        if selectedMetalButton != metal, selectedMetalButton != nil {
            metal.backgroundColor = .green
            metal.setTitleColor(.black, for: .normal)
            selectedMetalButton.backgroundColor = .black
            selectedMetalButton.setTitleColor(.white, for: .normal)
            selectedMetalButton = metal
        } else if selectedMetalButton != metal {
            selectedMetalButton = metal
            metal.backgroundColor = .green
            metal.setTitleColor(.black, for: .normal)
        } else {
            selectedMetalButton = nil
            metal.backgroundColor = .black
            metal.setTitleColor(.white, for: .normal)
        }
    }

    @IBAction func transitionMetal(_: Any) {
        if selectedMetalButton != transitionMetal, selectedMetalButton != nil {
            transitionMetal.backgroundColor = .green
            transitionMetal.setTitleColor(.black, for: .normal)
            selectedMetalButton.backgroundColor = .black
            selectedMetalButton.setTitleColor(.white, for: .normal)
            selectedMetalButton = transitionMetal
        } else if selectedMetalButton != transitionMetal {
            selectedMetalButton = transitionMetal
            transitionMetal.backgroundColor = .green
            transitionMetal.setTitleColor(.black, for: .normal)
        } else {
            selectedMetalButton = nil
            transitionMetal.backgroundColor = .black
            transitionMetal.setTitleColor(.white, for: .normal)
        }
    }

    @IBAction func nonMetal(_: Any) {
        if selectedMetalButton != nonMetal, selectedMetalButton != nil {
            nonMetal.backgroundColor = .green
            nonMetal.setTitleColor(.black, for: .normal)
            selectedMetalButton.backgroundColor = .black
            selectedMetalButton.setTitleColor(.white, for: .normal)
            selectedMetalButton = nonMetal
        } else if selectedMetalButton != nonMetal {
            selectedMetalButton = nonMetal
            nonMetal.backgroundColor = .green
            nonMetal.setTitleColor(.black, for: .normal)
        } else {
            selectedMetalButton = nil
            nonMetal.backgroundColor = .black
            nonMetal.setTitleColor(.white, for: .normal)
        }
    }

    @objc func updateProgressView() {
        timeLeft.text = "\(timeLeftTrack!) seconds left"
        timeLeftTrack -= 1
        if timeLeftTrack == 0 {
            progressBarTimer.invalidate()
            progressBarTimer = nil

            var isCorrect = false
            var isCorrect2 = false
            switch selectedButton {
            case groupOne:
                if gameTopic.correctAns1 == 1 {
                    points += level / 2
                    isCorrect = true
                }
            case groupTwo:
                if gameTopic.correctAns1 == 2 {
                    points += level / 2
                    isCorrect = true
                }
            case groupThree:
                if gameTopic.correctAns1 == 3 {
                    points += level / 2
                    isCorrect = true
                }
            case groupFour:
                if gameTopic.correctAns1 == 4 {
                    points += level / 2
                    isCorrect = true
                }
            default:
                break
            }

            switch selectedMetalButton {
            case metal:
                if gameTopic.correctAns2 == 1 {
                    points += level / 2
                    isCorrect2 = true
                }
            case transitionMetal:
                if gameTopic.correctAns2 == 2 {
                    points += level / 2
                    isCorrect2 = true
                }
            case nonMetal:
                if gameTopic.correctAns2 == 3 {
                    points += level / 2
                    isCorrect2 = true
                }
            default:
                break
            }

            if isCorrect, isCorrect2 {
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
    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "identifyElementsGameWIn" {
            let destVC = segue.destination as! PlayCorrectAnswerViewController
            destVC.currentLevel = currentLevel + 1
            destVC.currentGame = currentRound
        } else if segue.identifier == "identifyElementsGameLose" {
            let destVC = segue.destination as! PlayWrongAnswerViewController
            destVC.currentLevel = currentLevel + 1
            destVC.currentGame = currentRound
        }
    }
}
