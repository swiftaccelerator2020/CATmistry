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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addFirstIndicatorButton.layer.cornerRadius = 15
        addSecondIndicatorButton.layer.cornerRadius = 15
        addThirdIndicatorButton.layer.cornerRadius = 15
    }
    
    @IBAction func clickAddFirstIndicator(_ sender: Any) {
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
