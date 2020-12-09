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
    var indicatorPresent = false
    
    @IBOutlet weak var addFirstIndicatorButton: UIButton!
    @IBOutlet weak var monsterImageView: UIImageView!
    @IBOutlet weak var firstOptionImageView: UIImageView!
    @IBOutlet weak var firstOptionLabel: UILabel!
    @IBOutlet weak var secondOptionImageView: UIImageView!
    @IBOutlet weak var secondOptionLabel: UILabel!
    @IBOutlet weak var thirdOptionImageView: UIImageView!
    @IBOutlet weak var thirdOptionLabel: UILabel!
    @IBOutlet weak var fourthOptionImageView: UIImageView!
    @IBOutlet weak var fourthOptionLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addFirstIndicatorButton.layer.cornerRadius = 15
        submitButton.layer.cornerRadius = 25
        
        submitButton.isHidden = true
        
        let phOptionPath = phGameArray[currentLevel][currentGame]
        
        firstOptionImageView.image = UIImage(named: phOptionPath.options[0].image)
        secondOptionImageView.image = UIImage(named: phOptionPath.options[1].image)
        thirdOptionImageView.image = UIImage(named: phOptionPath.options[2].image)
        fourthOptionImageView.image = UIImage(named: phOptionPath.options[3].image)
        
        firstOptionLabel.text = phOptionPath.options[0].name
        secondOptionLabel.text = phOptionPath.options[1].name
        thirdOptionLabel.text = phOptionPath.options[2].name
        fourthOptionLabel.text = phOptionPath.options[3].name
    }
    
    func checkForCorrectAnswer(whichOption: Int) {
        currentGame += 1
        
        submitButton.isHidden = true
        monsterImageView.image = UIImage(named: "monster-regular.png")
        
        let phOptionPath = phGameArray[currentLevel][currentGame]
        
        firstOptionImageView.image = UIImage(named: phOptionPath.options[0].image)
        secondOptionImageView.image = UIImage(named: phOptionPath.options[1].image)
        thirdOptionImageView.image = UIImage(named: phOptionPath.options[2].image)
        fourthOptionImageView.image = UIImage(named: phOptionPath.options[3].image)
        
        firstOptionLabel.text = phOptionPath.options[0].name
        secondOptionLabel.text = phOptionPath.options[1].name
        thirdOptionLabel.text = phOptionPath.options[2].name
        fourthOptionLabel.text = phOptionPath.options[3].name
        
        if phGameArray[currentLevel][currentGame].startIsAcidic == true {
            if phGameArray[currentLevel][currentGame].options[whichOption].isAcidic == false {
                optionCorrect()
            } else {
                optionWrong()
            }
        } else if phGameArray[currentLevel][currentGame].startIsAcidic == false {
            if phGameArray[currentLevel][currentGame].options[whichOption].isAcidic == true {
                optionCorrect()
            } else {
                optionWrong()
            }
        }
    }
    
    func optionCorrect() {
        performSegue(withIdentifier: "adjustPhCorrect", sender: nil)
    }
    
    func optionWrong() {
        performSegue(withIdentifier: "adjustPhWrong", sender: nil)
    }
    
    @IBAction func clickAddUniversalIndicator(_ sender: Any) {
        if indicatorPresent == false {
            indicatorPresent = true
            if phGameArray[currentLevel][currentGame].startIsAcidic == true {
                monsterImageView.image = UIImage(named: phGameAcidicUniversalStartColour)
            } else {
                monsterImageView.image = UIImage(named: phGameAlkalinUniversalStartColour)
            }
        } else {
            indicatorPresent = false
            monsterImageView.image = UIImage(named: "monster-regular.png")
            submitButton.isHidden = true
            addFirstIndicatorButton.setTitle("Add Universal Indicator", for: .normal
            )
        }
    }
    
    @IBAction func clickOptionOne(_ sender: Any) {
        if indicatorPresent == true {
            monsterImageView.image = UIImage(named: phGameArray[currentLevel][currentGame].options[0].turnUniversalTankColour)
            addFirstIndicatorButton.setTitle("Reset", for: .normal)
        }
        chosenOption = 0
        if currentLevel == 0 {
            submitButton.isHidden = false
        }
        if currentLevel == 1 {
            checkForCorrectAnswer(whichOption: 0)
        }
    }
    
    @IBAction func clickSecondOption(_ sender: Any) {
        if indicatorPresent == true {
            monsterImageView.image = UIImage(named: phGameArray[currentLevel][currentGame].options[1].turnUniversalTankColour)
            addFirstIndicatorButton.setTitle("Reset", for: .normal)
        }
        chosenOption = 1
        if currentLevel == 0 {
            submitButton.isHidden = false
        }
        if currentLevel == 1 {
            checkForCorrectAnswer(whichOption: 1)
        }
    }
    
    @IBAction func clickThirdOption(_ sender: Any) {
        if indicatorPresent == true {
            monsterImageView.image = UIImage(named: phGameArray[currentLevel][currentGame].options[2].turnUniversalTankColour)
            addFirstIndicatorButton.setTitle("Reset", for: .normal)
        }
        chosenOption = 2
        if currentLevel == 0 {
            submitButton.isHidden = false
        }
        if currentLevel == 1 {
            checkForCorrectAnswer(whichOption: 2)
        }
    }
    
    @IBAction func clickOptionFour(_ sender: Any) {
        if indicatorPresent == true {
            monsterImageView.image = UIImage(named: phGameArray[currentLevel][currentGame].options[3].turnUniversalTankColour)
            addFirstIndicatorButton.setTitle("Reset", for: .normal)
        }
        chosenOption = 3
        if currentLevel == 0 {
            submitButton.isHidden = false
        }
        if currentLevel == 1 {
            checkForCorrectAnswer(whichOption: 3)
        }
    }
    
    @IBAction func clickSubmit(_ sender: Any) {
        checkForCorrectAnswer(whichOption: chosenOption)
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
