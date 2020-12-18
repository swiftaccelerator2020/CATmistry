//
//  PlayFindGasDetailsViewController.swift
//  CATmistry
//
//  Created by N HJ on 2/12/20.
//

import UIKit

class PlayFindGasDetailsViewController: UIViewController {

    var currentLevel = 0
    var selectedGasTank: UIView?
    var selectedGasTankString: String!
    var selectedGasTest: Int!
    var currentRound = 0
    var timer: Timer!
    var timeLeft = 20

    let color = UIColor(red: 123, green: 211, blue: 247)

    @IBOutlet weak var limewaterView: UIView!
    @IBOutlet weak var lightedSplintView: UIView!
    @IBOutlet weak var glowingSplintView: UIView!
    @IBOutlet weak var litmusView: UIView!
    @IBOutlet weak var gas1: UIView!
    @IBOutlet weak var gas2: UIView!
    @IBOutlet weak var gas3: UIView!
    @IBOutlet weak var gas4: UIView!
    @IBOutlet weak var gas1Check: UIImageView!
    @IBOutlet weak var gas2Check: UIImageView!
    @IBOutlet weak var gas3Check: UIImageView!
    @IBOutlet weak var gas4Check: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!

    var gases: GasTestGame!

    // var initialCenter = CGPoint()  // The initial center point of the view.

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        limewaterView.layer.cornerRadius = 15
        lightedSplintView.layer.cornerRadius = 15
        glowingSplintView.layer.cornerRadius = 15
        litmusView.layer.cornerRadius = 15
    }

    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        timeLeft = 20
        gases = gasesArray[currentRound]
        timerLabel.text = "\(20) seconds left"
        submitButton.isHidden = true
        gas1Check.isHidden = true
        gas2Check.isHidden = true
        gas3Check.isHidden = true
        gas4Check.isHidden = true
        questionLabel.text = gases.correctGasTank
        currentRound += 1
    }

    @IBAction func submitChoice(_ sender: Any) {
        timer.invalidate()
        timer = nil
        if selectedGasTankString == gases.correctGasTank {
            performSegue(withIdentifier: "findGasCorrect", sender: nil)
        } else {
            performSegue(withIdentifier: "findGasWrong", sender: nil)
        }
    }


    @IBAction func gas1Selected(_ sender: Any) {
        print("HI")

        if selectedGasTest != nil {

        } else {
            selectedGasTankString = gases.firstGasTank
            submitButton.isHidden = false
            submitButton.setTitle("Submit Gas 1", for: .normal)
            selectedGasTank?.backgroundColor = .none
            gas1.backgroundColor = color
            selectedGasTank = gas1
        }
    }

    @IBAction func gas2Selected(_ sender: Any) {
        print("HI")

        if selectedGasTest != nil {


        } else {
            selectedGasTankString = gases.secondGasTank
            submitButton.isHidden = false
            submitButton.setTitle("Submit Gas 2", for: .normal)
            selectedGasTank?.backgroundColor = .none
            gas2.backgroundColor = color
            selectedGasTank = gas2
        }

    }

    @IBAction func gas3Selected(_ sender: Any) {
        print("HI")

        if selectedGasTest != nil {

        } else {
            selectedGasTankString = gases.thirdGasTank
            submitButton.isHidden = false
            submitButton.setTitle("Submit Gas 3", for: .normal)
            selectedGasTank?.backgroundColor = .none
            gas3.backgroundColor = color
            selectedGasTank = gas3
        }

    }

    @IBAction func gas4Selected(_ sender: Any) {
        print("HI")

        if selectedGasTest != nil {

        } else {
            selectedGasTankString = gases.fourthGasTank
            submitButton.isHidden = false
            submitButton.setTitle("Submit Gas 4", for: .normal)
            selectedGasTank?.backgroundColor = .none
            gas4.backgroundColor = color
            selectedGasTank = gas4
        }

    }

    @IBAction func limewaterTestClicked(_ sender: Any) {
        print("HI")
        selectedGasTest = 0
        showResults()
        selectedGasTest = nil
    }

    @IBAction func lightedSplintTestClicked(_ sender: Any) {
        print("HI")
        selectedGasTest = 1
        showResults()
        selectedGasTest = nil
    }

    @IBAction func glowingSplintTestClicked(_ sender: Any) {
        print("HI")
        selectedGasTest = 2
        showResults()
        selectedGasTest = nil
    }

    @IBAction func litmusPaperTestClicked(_ sender: Any) {
        print("HI")
        selectedGasTest = 3

        showResults()

        selectedGasTest = nil
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "findGasCorrect" {
            let destVC = segue.destination as! PlayCorrectAnswerViewController
            destVC.currentLevel = currentLevel
            destVC.currentGame = currentRound
            destVC.gameType = 1
        } else if segue.identifier == "findGasWrong" {
            let destVC = segue.destination as! PlayWrongAnswerViewController
            destVC.currentLevel = currentLevel
            destVC.currentGame = currentRound
            destVC.gameType = 1
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

    @objc func updateTimer() {
        timeLeft -= 1
        timerLabel.text = "\(timeLeft) seconds left"
        if (timeLeft == 0) {
            currentRound += 1
            timer.invalidate()
            timer = nil
            performSegue(withIdentifier: "findGasWrong", sender: nil)
        }
    }

    func showResults() {
        gas1Check.isHidden = false
        gas2Check.isHidden = false
        gas3Check.isHidden = false
        gas4Check.isHidden = false
        if gases.firstGasIsPositive[selectedGasTest] == false {
            gas1Check.image = UIImage(named: "close.png")
        } else {
            gas1Check.image = UIImage(named: "check.png")
        }
        if gases.secondGasIsPositive[selectedGasTest] == false {
            gas2Check.image = UIImage(named: "close.png")
        } else {
            gas2Check.image = UIImage(named: "check.png")
        }
        if gases.thirdGasIsPositive[selectedGasTest] == false {
            gas3Check.image = UIImage(named: "close.png")
        } else {
            gas3Check.image = UIImage(named: "check.png")
        }
        if gases.forthGasIsPositive[selectedGasTest] == false {
            gas4Check.image = UIImage(named: "close.png")
        } else {
            gas4Check.image = UIImage(named: "check.png")
        }
        selectedGasTest = nil
    }
}
