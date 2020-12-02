//
//  IdentifyElementsSecondPageOfGameViewController.swift
//  CATmistry
//
//  Created by Wang Zerui on 2/12/20.
//

import UIKit

class IdentifyElementsSecondPageOfGameViewController: UIViewController {

    @IBOutlet weak var nonMetal: UIButton!
    @IBOutlet weak var transitionMetal: UIButton!
    @IBOutlet weak var metal: UIButton!
    @IBOutlet weak var groupFour: UIButton!
    @IBOutlet weak var groupThree: UIButton!
    @IBOutlet weak var groupTwo: UIButton!
    @IBOutlet weak var groupOne: UIButton!
    @IBOutlet weak var timeLeft: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        // Do any additional setup after loading the view.
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
