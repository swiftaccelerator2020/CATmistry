//
//  PlayFindGasStartViewController.swift
//  CATmistry
//
//  Created by N HJ on 2/12/20.
//

import UIKit

class PlayFindGasStartViewController: UIViewController {
    
    var currentLevel = 0

    @IBOutlet weak var backgroundLabel: UILabel!
    @IBOutlet weak var backgroundLabelView: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var levelSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabBarController?.tabBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        backgroundLabelView.layer.cornerRadius = 15
        startButton.layer.cornerRadius = 15
    }

    @IBAction func levelClicked(_ sender: Any) {
        currentLevel = levelSegmentedControl.selectedSegmentIndex
    }
    
    @IBAction func unwindToPlayHomePage(_ sender: Any) {
        tabBarController?.tabBar.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: false)
        _ = navigationController?.popToRootViewController(animated: true)
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
