//
//  IdentifyElementsStartPageOfGameViewController.swift
//  CATmistry
//
//  Created by Wang Zerui on 1/12/20.
//

import UIKit

class PlayIdentifyElementsStartViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var startGame: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    var currentLevel = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        descriptionLabel.layer.masksToBounds = true
        descriptionLabel.layer.cornerRadius = 25
        navigationController?.setNavigationBarHidden(true, animated: false)
        startGame.layer.masksToBounds = true
        startGame.layer.cornerRadius = 25

        descriptionLabel.padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)

        // Do any additional setup after loading the view.
    }

    @IBAction func segmentedControlPressed(_ sender: UISegmentedControl) {
        currentLevel = segmentedControl.selectedSegmentIndex
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "startGame"){
            let desti = segue.destination as! PlayIdentifyElementsSecondViewController
            desti.gameTopic = perioicTable[currentLevel].randomElement()
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


}
