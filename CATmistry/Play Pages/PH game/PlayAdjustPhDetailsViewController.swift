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

    @IBOutlet weak var addFirstIndicatorButton: UIButton!
    @IBOutlet weak var addSecondIndicatorButton: UIButton!
    @IBOutlet weak var addThirdIndicatorButton: UIButton!
    @IBOutlet weak var monsterImageView: UIImageView!
    @IBOutlet weak var firstOptionImageView: UIImageView!
    @IBOutlet weak var firstOptionLabel: UILabel!
    @IBOutlet weak var secondOptionImageView: UIImageView!
    @IBOutlet weak var secondOptionLabel: UILabel!
    @IBOutlet weak var thirdOptionImageView: UIImageView!
    @IBOutlet weak var thirdOptionLabel: UILabel!
    @IBOutlet weak var fourthOptionImageView: UIImageView!
    @IBOutlet weak var fourthOptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addFirstIndicatorButton.layer.cornerRadius = 15
        addSecondIndicatorButton.layer.cornerRadius = 15
        addThirdIndicatorButton.layer.cornerRadius = 15
        
        if currentLevel == 0 {
            addFirstIndicatorButton.isHidden = true
            addSecondIndicatorButton.isHidden = true
        } else if currentLevel == 2 {
            addFirstIndicatorButton.isHidden = true
            addSecondIndicatorButton.isHidden = true
            addThirdIndicatorButton.setTitle(phGameArray[currentLevel][currentGame].indicatorButtonText!, for: .normal)
        }
        
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
        let optionClickChangedColour = phGameArray[currentLevel][currentGame].options[whichOption].turnUniversalTankColour
        let universalAcidicCorrect = phGameAcidicIndicatorColours.universalCorrect
        let universalAlkalineCorrect = phGameAlkalineIndicatorColours.universalCorrect
        let methylOrangeAcidicCorrect = phGameAcidicIndicatorColours.methylOrangeCorrect
        let methylOrangeAlkalineCorrect = phGameAlkalineIndicatorColours.methylOrangeCorrect
        let litmusAcidicCorrect = phGameAcidicIndicatorColours.litmusCorrect
        let litmusAlkalineCorrect = phGameAlkalineIndicatorColours.litmusCorrect
        let phenolphthaleinAcidicCorrect = phGameAcidicIndicatorColours.phenolphthaleinCorrect
        let phenolphthaleinAlkalineCorrect = phGameAlkalineIndicatorColours.phenolphthaleinCorrect
        
        if phGameArray[currentLevel][currentGame].startIsAcidic == true {
            if optionClickChangedColour == universalAlkalineCorrect ||  optionClickChangedColour == methylOrangeAlkalineCorrect || optionClickChangedColour == litmusAlkalineCorrect || optionClickChangedColour == phenolphthaleinAlkalineCorrect {
                optionCorrect()
            } else {
                optionWrong()
            }
        } else if phGameArray[currentLevel][currentGame].startIsAcidic == false {
            if optionClickChangedColour == universalAcidicCorrect || optionClickChangedColour == methylOrangeAcidicCorrect || optionClickChangedColour == litmusAcidicCorrect || optionClickChangedColour == phenolphthaleinAcidicCorrect {
                optionCorrect()
            } else {
                optionWrong()
            }
        }
    }
    
    func optionCorrect() {
        
    }
    
    func optionWrong() {
        
    }
    
    @IBAction func clickAddFirstndicator(_ sender: Any) {
        monsterImageView.image = UIImage(named: "")
    }
    
    @IBAction func clickAddSecondIndicator(_ sender: Any) {
        monsterImageView.image = UIImage(named: "")
    }
    
    @IBAction func clickAddThirdIndicator(_ sender: Any) {
        monsterImageView.image = UIImage(named: "")
    }
    
    @IBAction func clickOptionOne(_ sender: Any) {
        monsterImageView.image = UIImage(named: phGameArray[currentLevel][currentGame].options[0].turnUniversalTankColour)
        checkForCorrectAnswer(whichOption: 0)
    }
    
    @IBAction func clickSecondOption(_ sender: Any) {
        monsterImageView.image = UIImage(named: phGameArray[currentLevel][currentGame].options[1].turnUniversalTankColour)
        checkForCorrectAnswer(whichOption: 1)
    }
    
    @IBAction func clickThirdOption(_ sender: Any) {
        monsterImageView.image = UIImage(named: phGameArray[currentLevel][currentGame].options[2].turnUniversalTankColour)
        checkForCorrectAnswer(whichOption: 2)
    }
    
    @IBAction func clickOptionFour(_ sender: Any) {
        monsterImageView.image = UIImage(named: phGameArray[currentLevel][currentGame].options[3].turnUniversalTankColour)
        checkForCorrectAnswer(whichOption: 4)
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
