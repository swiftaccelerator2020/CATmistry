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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabBarController?.tabBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        backgroundLabelView.layer.cornerRadius = 15
        startButton.layer.cornerRadius = 15
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
