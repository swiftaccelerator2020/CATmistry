//
//  PlayFindGasDetailsViewController.swift
//  CATmistry
//
//  Created by N HJ on 2/12/20.
//

import UIKit

class PlayFindGasDetailsViewController: UIViewController {
    
    var currentLevel = 0
    var selectedGasTank: UIButton?
    var selectedGasTankString: String!
    var selectedGasTest: Int!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var limewater: UIButton!
    @IBOutlet weak var lightedSplint: UIButton!
    @IBOutlet weak var glowingSplint: UIButton!
    @IBOutlet weak var litmus: UIButton!
    @IBOutlet weak var gas1: UIButton!
    @IBOutlet weak var gas2: UIButton!
    @IBOutlet weak var gas3: UIButton!
    @IBOutlet weak var gas4: UIButton!
    @IBOutlet weak var submit: UIButton!
    
    var gases = GasTestGame(firstGasTank: "Hydrogen", secondGasTank: "Oxygen", thirdGasTank: "Carbon Dioxide", fourthGasTank: "Ammonia", firstGasIsPositive: [false, false, false, true], secondGasIsPositive: [false, false, false, true], thirdGasIsPositive: [false, false, false, true], forthGasIsPositive: [false, false, false, true], correctGasTank: "Hydrogen")

    // var initialCenter = CGPoint()  // The initial center point of the view.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submit.isHidden = true
        resultsLabel.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitChoice(_ sender: Any) {
        if selectedGasTankString == gases.correctGasTank {
            performSegue(withIdentifier: "findGasCorrect", sender: nil)
        } else {
            performSegue(withIdentifier: "findGasWrong", sender: nil)
        }
    }
    
    
     @IBAction func limewaterTest(_ sender: Any) {
        selectedGasTank = nil
        selectedGasTest = 0
     }
    
    @IBAction func lightedSplintTest(_ sender: Any) {
        selectedGasTank = nil
        selectedGasTest = 1
    }
    
    @IBAction func glowingSplintTest(_ sender: Any) {
        selectedGasTank = nil
        selectedGasTest = 2
    }
    
    @IBAction func litmusPaper(_ sender: Any) {
        selectedGasTank = nil
        selectedGasTest = 3
    }
    
    @IBAction func selectGas1(_ sender: Any) {
        if selectedGasTank != gas1 {
            selectedGasTank = gas1
        } else {
            selectedGasTank = nil
        }
        if selectedGasTest != nil {
            resultsLabel.isHidden = false
            if gases.firstGasIsPositive[selectedGasTest] {
                resultsLabel.text = "positive"
            } else {
                resultsLabel.text = "negative"
            }
            selectedGasTank = nil
            selectedGasTest = nil
            selectedGasTankString = nil
        }
        if selectedGasTank != nil && selectedGasTest == nil {
            selectedGasTankString = gases.firstGasTank
            submit.isHidden = false
        }
    }
    
    @IBAction func selectGas2(_ sender: Any) {
        if selectedGasTank != gas2 {
            selectedGasTank = gas2
        } else {
            selectedGasTank = nil
        }
        if selectedGasTest != nil {
            resultsLabel.isHidden = false
            if gases.secondGasIsPositive[selectedGasTest] {
                resultsLabel.text = "positive"
            } else {
                resultsLabel.text = "negative"
            }
            selectedGasTank = nil
            selectedGasTest = nil
            selectedGasTankString = nil
        }
        if selectedGasTank != nil && selectedGasTest == nil {
            selectedGasTankString = gases.secondGasTank
            submit.isHidden = false
        }
    }
    
    @IBAction func selectGas3(_ sender: Any) {
        if selectedGasTank != gas3 {
            selectedGasTank = gas3
        } else {
            selectedGasTank = nil
        }
        if selectedGasTest != nil {
            resultsLabel.isHidden = false
            if gases.thirdGasIsPositive[selectedGasTest] {
                resultsLabel.text = "positive"
            } else {
                resultsLabel.text = "negative"
            }
            selectedGasTank = nil
            selectedGasTest = nil
            selectedGasTankString = nil
        }
        if selectedGasTank != nil && selectedGasTest == nil {
            selectedGasTankString = gases.thirdGasTank
            submit.isHidden = false
        }
    }
    
    @IBAction func selectGas4(_ sender: Any) {
        if selectedGasTank != gas4 {
            selectedGasTank = gas4
        } else {
            selectedGasTank = nil
        }
        if selectedGasTest != nil {
            resultsLabel.isHidden = false
            if gases.forthGasIsPositive[selectedGasTest] {
                resultsLabel.text = "positive"
            } else {
                resultsLabel.text = "negative"
            }
            selectedGasTank = nil
            selectedGasTest = nil
            selectedGasTankString = nil
        }
        if selectedGasTank != nil && selectedGasTest == nil {
            selectedGasTankString = gases.thirdGasTank
            submit.isHidden = false
        }
    }
    
    /*
     @IBAction func panPiece(_ gestureRecognizer : UIPanGestureRecognizer) {
       guard gestureRecognizer.view != nil else {return}
       let piece = gestureRecognizer.view!
       // Get the changes in the X and Y directions relative to
       // the superview's coordinate space.
       let translation = gestureRecognizer.translation(in: piece.superview)
       if gestureRecognizer.state == .began {
          // Save the view's original position.
          self.initialCenter = piece.center
       }
          // Update the position for the .began, .changed, and .ended states
       if gestureRecognizer.state != .cancelled {
          // Add the X and Y translation to the view's original position.
          let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
          piece.center = newCenter
       }
       else {
          // On cancellation, return the piece to its original location.
          piece.center = initialCenter
       }
    }
    */
    /*
    // MARK: - Navigation 

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
