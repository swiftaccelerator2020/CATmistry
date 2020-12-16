//
//  PlayAdjustPhDetailsViewController.swift
//  CATmistry
//
//  Created by N HJ on 2/12/20.
//

import UIKit

class PlayAdjustPhDetailsViewController: UIViewController {

    var currentLevel = 0
    var currentGame = 0
    var chosenOption = 0
    var correctGames = 0
    var wrongGames = 0
    var indicatorPresent = false
    var timeLeft = 20
    var phOptionsSet = Set<PhOption>()
    var phOptionsArray: Array<PhOption>!
    var timer: Timer!
    
    @IBOutlet weak var addFirstIndicatorButton: UIButton!
    @IBOutlet weak var monsterImageView: UIImageView!
    @IBOutlet weak var firstOptionImageView: UIImageView!
//    @IBOutlet weak var firstOptionLabel: UILabel!
    @IBOutlet weak var secondOptionImageView: UIImageView!
//    @IBOutlet weak var secondOptionLabel: UILabel!
    @IBOutlet weak var thirdOptionImageView: UIImageView!
//    @IBOutlet weak var thirdOptionLabel: UILabel!
    @IBOutlet weak var fourthOptionImageView: UIImageView!
//    @IBOutlet weak var fourthOptionLabel: UILabel!
    @IBOutlet weak var firstOptionStackView: UIStackView!
    @IBOutlet weak var secondOptionStackView: UIStackView!
    @IBOutlet weak var thirdOptionStackView: UIStackView!
    @IBOutlet weak var fourthOptionStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!
    @IBOutlet weak var submitButtonIsVisibleConstraint: NSLayoutConstraint!
    @IBOutlet weak var submitButtonIsHiddenConstraint: NSLayoutConstraint!
    @IBOutlet weak var timerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addFirstIndicatorButton.layer.cornerRadius = 15
        firstOptionStackView.layer.masksToBounds = true
        firstOptionStackView.layer.cornerRadius = 15
        secondOptionStackView.layer.masksToBounds = true
        secondOptionStackView.layer.cornerRadius = 15
        thirdOptionStackView.layer.masksToBounds = true
        thirdOptionStackView.layer.cornerRadius = 15
        fourthOptionStackView.layer.masksToBounds = true
        fourthOptionStackView.layer.cornerRadius = 15
        scrollView.layer.cornerRadius = 15
        contentView.layer.cornerRadius = 15
        submitButton.layer.cornerRadius = 25
        timerLabel.layer.cornerRadius = 15
        timerLabel.layer.masksToBounds = true

        if currentLevel == 1 {
            submitButton.isHidden = true
            contentViewHeight.constant -= 68
            self.view.layoutIfNeeded()
            submitButtonIsVisibleConstraint?.isActive = false
            submitButtonIsHiddenConstraint?.isActive = true
        } else {
            submitButton.isEnabled = false
            submitButton.titleLabel?.isEnabled = false
        }

        while phOptionsSet.count < 4 {
            let randomIndex = Int(arc4random_uniform(UInt32(phGameOptionsArray.count)))
            phOptionsSet.insert(phGameOptionsArray[randomIndex])
        }

        phOptionsArray = Array(phOptionsSet)

        firstOptionImageView.image = UIImage(named: phOptionsArray[0].image)
        secondOptionImageView.image = UIImage(named: phOptionsArray[1].image)
        thirdOptionImageView.image = UIImage(named: phOptionsArray[2].image)
        fourthOptionImageView.image = UIImage(named: phOptionsArray[3].image)

//        firstOptionLabel.text = phOptionsArray[0].name
//        secondOptionLabel.text = phOptionsArray[1].name
//        thirdOptionLabel.text = phOptionsArray[2].name
//        fourthOptionLabel.text = phOptionsArray[3].name
    }

    override func viewDidAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(PlayAdjustPhDetailsViewController.updateTimer), userInfo: nil, repeats: true)
    }
    @IBAction func clickAddUniversalIndicator(_ sender: Any) {
        if addFirstIndicatorButton.titleLabel!.text == "Add Universal Indicator" {
            indicatorPresent = true
            addFirstIndicatorButton.setTitle("Reset", for: .normal)
            if phGameArray[currentLevel][currentGame].startIsAcidic == true {
                monsterImageView.image = UIImage(named: phGameAcidicUniversalStartColour)
            } else {
                monsterImageView.image = UIImage(named: phGameAlkalinUniversalStartColour)
            }
        } else {
            submitButton.isEnabled = false
            submitButton.titleLabel?.isEnabled = false
            firstOptionStackView.backgroundColor = UIColor.white
            secondOptionStackView.backgroundColor = UIColor.white
            thirdOptionStackView.backgroundColor = UIColor.white
            fourthOptionStackView.backgroundColor = UIColor.white
            indicatorPresent = false
            monsterImageView.image = UIImage(named: "monster-regular.png")
            addFirstIndicatorButton.setTitle("Add Universal Indicator", for: .normal)
            scrollView.scrollToTop()
        }
    }

    @IBAction func clickOptionOne(_ sender: Any) {
        firstOptionStackView.backgroundColor = UIColor(red: 88/255, green: 214/255, blue: 141/255, alpha: 1)
        secondOptionStackView.backgroundColor = UIColor.white
        thirdOptionStackView.backgroundColor = UIColor.white
        fourthOptionStackView.backgroundColor = UIColor.white
        if indicatorPresent == true {
            monsterImageView.image = UIImage(named: phOptionsArray[0].turnUniversalTankColour)
        }
        addFirstIndicatorButton.setTitle("Reset", for: .normal)
        chosenOption = 0
        if currentLevel == 0 {
            submitButton.isEnabled = true
            submitButton.titleLabel?.isEnabled = true
        }
        if currentLevel == 1 {
            checkForCorrectAnswer(whichOption: 0)
        }
    }

    @IBAction func clickSecondOption(_ sender: Any) {
        firstOptionStackView.backgroundColor = UIColor.white
        secondOptionStackView.backgroundColor = UIColor(red: 88/255, green: 214/255, blue: 141/255, alpha: 1)
        thirdOptionStackView.backgroundColor = UIColor.white
        fourthOptionStackView.backgroundColor = UIColor.white
        if indicatorPresent == true {
            monsterImageView.image = UIImage(named: phOptionsArray[1].turnUniversalTankColour)
        }
        addFirstIndicatorButton.setTitle("Reset", for: .normal)
        chosenOption = 1
        if currentLevel == 0 {
            submitButton.isEnabled = true
            submitButton.titleLabel?.isEnabled = true
        }
        if currentLevel == 1 {
            checkForCorrectAnswer(whichOption: 1)
        }
    }

    @IBAction func clickThirdOption(_ sender: Any) {
        firstOptionStackView.backgroundColor = UIColor.white
        secondOptionStackView.backgroundColor = UIColor.white
        thirdOptionStackView.backgroundColor = UIColor(red: 88/255, green: 214/255, blue: 141/255, alpha: 1)
        fourthOptionStackView.backgroundColor = UIColor.white
        if indicatorPresent == true {
            monsterImageView.image = UIImage(named: phOptionsArray[2].turnUniversalTankColour)
        }
        addFirstIndicatorButton.setTitle("Reset", for: .normal)
        chosenOption = 2
        if currentLevel == 0 {
            submitButton.isEnabled = true
            submitButton.titleLabel?.isEnabled = true
        }
        if currentLevel == 1 {
            checkForCorrectAnswer(whichOption: 2)
        }
    }

    @IBAction func clickOptionFour(_ sender: Any) {
        firstOptionStackView.backgroundColor = UIColor.white
        secondOptionStackView.backgroundColor = UIColor.white
        thirdOptionStackView.backgroundColor = UIColor.white
        fourthOptionStackView.backgroundColor = UIColor(red: 88/255, green: 214/255, blue: 141/255, alpha: 1)
        if indicatorPresent == true {
            monsterImageView.image = UIImage(named: phOptionsArray[3].turnUniversalTankColour)
        }
        addFirstIndicatorButton.setTitle("Reset", for: .normal)
        chosenOption = 3
        if currentLevel == 0 {
            submitButton.isEnabled = true
            submitButton.titleLabel?.isEnabled = true
        }
        if currentLevel == 1 {
            checkForCorrectAnswer(whichOption: 3)
        }
    }

    @IBAction func clickSubmit(_ sender: Any) {
        checkForCorrectAnswer(whichOption: chosenOption)
    }

    // Other Functions
    func checkForCorrectAnswer(whichOption: Int) {
        print(phOptionsArray[whichOption])

        if currentLevel == 0 {
            submitButton.isEnabled = false
            submitButton.titleLabel?.isEnabled = false
        }

        scrollView.scrollToTop()

        addFirstIndicatorButton.setTitle("Add Universal Indicator", for: .normal)
        monsterImageView.image = UIImage(named: "monster-regular.png")
        firstOptionStackView.backgroundColor = UIColor.white
        secondOptionStackView.backgroundColor = UIColor.white
        thirdOptionStackView.backgroundColor = UIColor.white
        fourthOptionStackView.backgroundColor = UIColor.white

        indicatorPresent = false

        if phGameArray[currentLevel][currentGame].startIsAcidic == true {
            if phOptionsArray[whichOption].isAcidic == false {
                optionCorrect()
            } else {
                optionWrong()
            }
        } else if phGameArray[currentLevel][currentGame].startIsAcidic == false {
            if phOptionsArray[whichOption].isAcidic == true {
                optionCorrect()
            } else {
                optionWrong()
            }
        }

        if phGameArray[currentLevel].count != currentGame - 1 {
            currentGame += 1
        } else {
            currentGame = 0
        }

        phOptionsSet = []

        while phOptionsSet.count < 4 {
            let randomIndex = Int(arc4random_uniform(UInt32(phGameOptionsArray.count)))
            phOptionsSet.insert(phGameOptionsArray[randomIndex])
        }

        phOptionsArray = Array(phOptionsSet)

        firstOptionImageView.image = UIImage(named: phOptionsArray[0].image)
        secondOptionImageView.image = UIImage(named: phOptionsArray[1].image)
        thirdOptionImageView.image = UIImage(named: phOptionsArray[2].image)
        fourthOptionImageView.image = UIImage(named: phOptionsArray[3].image)

//        firstOptionLabel.text = phOptionsArray[0].name
//        secondOptionLabel.text = phOptionsArray[1].name
//        thirdOptionLabel.text = phOptionsArray[2].name
//        fourthOptionLabel.text = phOptionsArray[3].name
    }

    func optionCorrect() {
        correctGames += 1
        performSegue(withIdentifier: "adjustPhCorrect", sender: nil)
    }

    func optionWrong() {
        wrongGames += 1
        performSegue(withIdentifier: "adjustPhWrong", sender: nil)
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "adjustPhCorrect" {
            let destVC = segue.destination as! PlayCorrectAnswerViewController
            destVC.currentLevel = currentLevel
            destVC.currentGame = currentGame
        } else if segue.identifier == "adjustPhWrong" {
            let destVC = segue.destination as! PlayWrongAnswerViewController
            destVC.currentLevel = currentLevel
            destVC.currentGame = currentGame
        }
    }
    
    @objc func updateTimer() {
        timeLeft -= 1
        timerLabel.text = "\(timeLeft) seconds left"
        if (timeLeft == 0) {
            currentGame -= 1
            performSegue(withIdentifier: "findGasWrong", sender: nil)
        }
    }
}

extension UIScrollView {
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
   }
}
