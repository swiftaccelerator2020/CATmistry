//
//  QuizEndedViewController.swift
//  CATmistry
//
//  Created by Wang Zerui on 13/12/20.
//

import UIKit

class QuizEndedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)
        tabBarController?.tabBar.isHidden = true

        // Do any additional setup after loading the view.
    }

    @IBAction func goBackButton(_: Any) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        tabBarController?.tabBar.isHidden = false
        navigationController!.popToRootViewController(animated: true)
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
