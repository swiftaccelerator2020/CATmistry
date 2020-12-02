//
//  IdentifyElementsStartPageOfGameViewController.swift
//  CATmistry
//
//  Created by Wang Zerui on 1/12/20.
//

import UIKit

class PlayIdentifyElementsStartViewController: UIViewController {

    @IBOutlet weak var backgroundLabelView: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    var currentLevel = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabBarController?.tabBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func segmentedControlPressed(_ sender: UISegmentedControl) {
        currentLevel = segmentedControl.selectedSegmentIndex
    }


    @IBAction func unwindToPlayHomePage(_ sender: Any) {
        tabBarController?.tabBar.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: false)
        _ = navigationController?.popToRootViewController(animated: true)
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
