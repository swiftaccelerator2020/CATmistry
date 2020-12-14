//
//  PlayRetrieveSolidsStartViewController.swift
//  CATmistry
//
//  Created by N HJ on 2/12/20.
//

import UIKit

class PlayRetrieveSolidsStartViewController: UIViewController {
    var currentLevel = 0

    @IBOutlet var backgroundLabelView: UIView!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var levelSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabBarController?.tabBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        backgroundLabelView.layer.cornerRadius = 10
        startButton.layer.cornerRadius = 25
    }

    @IBAction func levelClicked(_: Any) {
        currentLevel = levelSegmentedControl.selectedSegmentIndex
    }

    @IBAction func unwindToPlayHomePage(_: Any) {
        tabBarController?.tabBar.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: false)
        _ = navigationController?.popToRootViewController(animated: true)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToRetrieveSolidsDetails" {
            let dest = segue.destination as! PlayRetrieveSolidsDetailsViewController
            dest.currentLevel = currentLevel
        }
    }
}
