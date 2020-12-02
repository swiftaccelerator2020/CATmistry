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
    
    var selectedButton: UIButton!
    
    @IBAction func groupOne(_ sender: Any) {
        if (selectedButton != groupOne && selectedButton != nil){
            groupOne.backgroundColor = .green
            groupOne.setTitleColor(.black, for: .normal)
            selectedButton.backgroundColor = .black
            selectedButton.setTitleColor(.white, for: .normal)
            selectedButton = groupOne
        } else if (selectedButton != groupOne){
            selectedButton = groupOne
            groupOne.backgroundColor = .green
            groupOne.setTitleColor(.black, for: .normal)
        } else {
            selectedButton = nil
            groupOne.backgroundColor = .black
            groupOne.setTitleColor(.white, for: .normal)
        }
    }
    
    @IBAction func groupTwo(_ sender: Any) {
        if (selectedButton != groupTwo && selectedButton != nil){
            groupTwo.backgroundColor = .green
            groupTwo.setTitleColor(.black, for: .normal)
            selectedButton.backgroundColor = .black
            selectedButton.setTitleColor(.white, for: .normal)
            selectedButton = groupTwo
        } else if (selectedButton != groupTwo){
            selectedButton = groupTwo
            groupTwo.backgroundColor = .green
            groupTwo.setTitleColor(.black, for: .normal)
        } else {
            selectedButton = nil
            groupTwo.backgroundColor = .black
            groupTwo.setTitleColor(.white, for: .normal)
        }
    }
    
    @IBAction func groupThree(_ sender: Any) {
        if (selectedButton != groupThree && selectedButton != nil){
            groupThree.backgroundColor = .green
            groupThree.setTitleColor(.black, for: .normal)
            selectedButton.backgroundColor = .black
            selectedButton.setTitleColor(.white, for: .normal)
            selectedButton = groupThree
        } else if (selectedButton != groupThree){
            selectedButton = groupThree
            groupThree.backgroundColor = .green
            groupThree.setTitleColor(.black, for: .normal)
        } else {
            selectedButton = nil
            groupThree.backgroundColor = .black
            groupThree.setTitleColor(.white, for: .normal)
        }
    }
    
    @IBAction func groupFour(_ sender: Any) {
        if (selectedButton != groupFour && selectedButton != nil){
            groupFour.backgroundColor = .green
            groupFour.setTitleColor(.black, for: .normal)
            selectedButton.backgroundColor = .black
            selectedButton.setTitleColor(.white, for: .normal)
            selectedButton = groupFour
        } else if (selectedButton != groupFour){
            selectedButton = groupFour
            groupFour.backgroundColor = .green
            groupFour.setTitleColor(.black, for: .normal)
        } else {
            selectedButton = nil
            groupFour.backgroundColor = .black
            groupFour.setTitleColor(.white, for: .normal)
        }

    }
    
    @IBAction func metal(_ sender: Any) {
    }
    
    @IBAction func transitionMetal(_ sender: Any) {
    }
    
    @IBAction func nonMetal(_ sender: Any) {
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
