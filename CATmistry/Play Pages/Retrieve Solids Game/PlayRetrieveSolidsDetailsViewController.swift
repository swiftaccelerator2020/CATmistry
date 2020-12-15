//
//  PlayRetrieveSolidsViewController.swift
//  CATmistry
//
//  Created by N HJ on 2/12/20.
//

import UIKit

class PlayRetrieveSolidsDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Variable Declaration

    var selectedElement: Int?
    var isCorrect: Bool?
    var numOfItems = 4
    var currentLevel = 0
    var progressBarTimer: Timer!
    var specificSeperationMethodSet = Set<SpecificSeperationMethod>()
    var elements: Array<SpecificSeperationMethod>!
    var hardMode = true

    // MARK: - IBOutlets Declaration

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var seperationTableView: UITableView!
    @IBOutlet weak var choicesTableView: UITableView!
    @IBOutlet weak var selectedChoiceLabel: UIButton!
    @IBOutlet weak var isWrong: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if (currentLevel == 2){
            hardMode = true
        } else {
            hardMode = false
        }

        if (!hardMode) {
            let color = UIColor(rgb: 0x7CC2F5)
            self.view.backgroundColor = color
        } else {
            let color = UIColor(rgb: 0xFF0000)
            self.view.backgroundColor = color
        }

        seperationTableView.dataSource = self
        seperationTableView.delegate = self
        self.seperationTableView.tableFooterView = UIView()
        choicesTableView.dataSource = self
        choicesTableView.delegate = self
        self.choicesTableView.allowsSelection = true
        self.choicesTableView.tableFooterView = UIView()

        selectedChoiceLabel.isHidden = true
        isWrong.isHidden = true

        progressView.transform = CGAffineTransform(rotationAngle: .pi / -2)
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 30)

        isWrong.layer.cornerRadius = 25

        progressView.progress = Float(numOfItems)/10

        while specificSeperationMethodSet.count <= 10 {
            let randomIndex = Int(arc4random_uniform(UInt32(retrieveSolidsArray.count)))
            specificSeperationMethodSet.insert(retrieveSolidsArray[randomIndex])
        }

        elements = Array(specificSeperationMethodSet)

        if (hardMode) {
            self.progressBarTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(PlayRetrieveSolidsDetailsViewController.updateProgressView), userInfo: nil, repeats: true)
        }

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        /*
        let color = UIColor(rgb: 0xFF0000)
        let darkRed = UIColor(rgb: 0xCC0000)
        self.view.backgroundColor = color

        let view2 = UIView()
        self.view.addSubview(view2)
        view2.isUserInteractionEnabled = false

        if (hardMode) {
            UIView.animate(withDuration: 2, delay: 0.0, options:[UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse], animations: {
                 view2.backgroundColor = color
                 view2.backgroundColor = darkRed
            }, completion: nil)
        } */
    }
    // MARK: - First Table View

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == self.seperationTableView){
            print(indexPath.row)
            let cell = tableView.dequeueReusableCell(withIdentifier: "loremIpsum", for: indexPath)
            cell.textLabel?.text = "\(elements[indexPath.row].name) - \(elements[indexPath.row].properties)"
            return cell
        } else if (tableView == choicesTableView) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "loremIpsum2", for: indexPath)
            cell.textLabel?.text = elements[selectedElement!].givenMethods.methods[indexPath.row].methodName
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if (tableView == seperationTableView){
            return numOfItems
        } else if (tableView == choicesTableView){
            if (selectedElement != nil){
                return elements[selectedElement!].givenMethods.methods.count
            } else {
                return 0
            }
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView == seperationTableView){
            selectedElement = indexPath.row
            tableView.deselectRow(at: indexPath, animated: true)
            selectedChoiceLabel.isHidden = true
            index = indexPath.row
            choicesTableView.reloadData()
        } else if (tableView == choicesTableView){
            selectedChoiceLabel.setTitle("Submit: \(elements[selectedElement!].givenMethods.methods[indexPath.row].methodName)", for: .normal)
            isCorrect = elements[selectedElement!].givenMethods.methods[indexPath.row].isCorrect
            selectedChoiceLabel.isHidden = false
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    var index = 0

    @IBAction func submitChoice(_ sender: Any) {
        isWrong.isHidden = false
        if (!isCorrect!) {
            isWrong.text = "WRONG"
            isWrong.backgroundColor = .red
            numOfItems += 1
            progressView.progress += 0.1
        } else if (isCorrect!) {
            isWrong.text = "CORRECT"
            isWrong.backgroundColor = .green
            selectedChoiceLabel.isHidden = true
            selectedElement = nil
            index = 0
            choicesTableView.reloadData()
            numOfItems -= 1
            progressView.progress -= 0.1
        }
        if (numOfItems <= 0) {
            // win
            changePoints(10)
            performSegue(withIdentifier: "seperationGameWIn", sender: nil)
        } else if (numOfItems > 10) {
            // lose
            changePoints(-2)
            performSegue(withIdentifier: "seperationGameLose", sender: nil)
        }
        seperationTableView.reloadData()
        let seconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.isWrong.isHidden = true
        }
    }

    @objc func updateProgressView(){
        numOfItems += 1
        progressView.progress += 0.1
        if (progressView.progress <= 0) {
            // win
            changePoints(10)
            performSegue(withIdentifier: "seperationGameWIn", sender: nil)
        } else if (numOfItems > 10) {
            // lose
            changePoints(-2)
            performSegue(withIdentifier: "seperationGameLose", sender: nil)
        }
        seperationTableView.reloadData()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "seperationGameLose"){
            let dest = segue.destination as! PlayWrongAnswerViewController
            dest.isSeperation = true
        }
        if (segue.identifier == "seperationGameWIn"){
            let dest = segue.destination as! PlayCorrectAnswerViewController
            dest.isSeperation = true
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
