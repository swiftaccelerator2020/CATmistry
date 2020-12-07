//
//  PlayAdjustPhDetailsViewController.swift
//  CATmistry
//
//  Created by N HJ on 2/12/20.
//

import UIKit

class PlayAdjustPhDetailsViewController: UIViewController {
    
    var currentLevel = 0

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
            addThirdIndicatorButton.setTitle(phGameArray[currentLevel][0].indicatorButtonText!, for: .normal)
        }
        
        firstOptionImageView.image = UIImage(named: phGameArray[currentLevel][0].firstItem.image)
        secondOptionImageView.image = UIImage(named: phGameArray[currentLevel][0].secondItem.image)
        thirdOptionImageView.image = UIImage(named: phGameArray[currentLevel][0].thirdItem.image)
        fourthOptionImageView.image = UIImage(named: phGameArray[currentLevel][0].fourthItem.image)
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
        print("1")
    }
    
    @IBAction func clickSecondOption(_ sender: Any) {
        print("2")
    }
    
    @IBAction func clickThirdOption(_ sender: Any) {
        print("3")
    }
    
    @IBAction func clickOptionFour(_ sender: Any) {
        print("4")
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
