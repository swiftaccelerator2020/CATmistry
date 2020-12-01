//
//  IdentifyElementsStartPageOfGameViewController.swift
//  CATmistry
//
//  Created by Wang Zerui on 1/12/20.
//

import UIKit

class IdentifyElementsStartPageOfGameViewController: UIViewController {

    @IBOutlet weak var startGame: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        descriptionLabel.layer.masksToBounds = true
        descriptionLabel.layer.cornerRadius = 25
        navigationController?.setNavigationBarHidden(true, animated: false)
        startGame.layer.masksToBounds = true
        startGame.layer.cornerRadius = 25

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
