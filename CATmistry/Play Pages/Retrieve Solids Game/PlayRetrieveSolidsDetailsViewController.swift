//
//  PlayRetrieveSolidsViewController.swift
//  CATmistry
//
//  Created by N HJ on 2/12/20.
//

import UIKit

class PlayRetrieveSolidsDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var currentLevel = 0
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var seperationTableView: UITableView!
    @IBOutlet weak var choicesTableView: UITableView!
    @IBOutlet weak var selectedChoiceLabel: UIButton!
    
    @IBOutlet weak var isWrong: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        // Do any additional setup after loading the view.
    }
    
    //var elements: [specificSeperationMethod]!
    var elements = [specificSeperationMethod(picture: "", name: "Boron", properties: "filter", givenMethods: GivenSeperationMethods(methods: [SeperationMethods(methodName: "N.A", isCorrect: false),
                                                                                                                                              SeperationMethods(methodName: "Correct", isCorrect: true)]))]
    
    // MARK: - First Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == self.seperationTableView){
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
            return elements.count
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
    
    var selectedElement: Int?
    var isCorrect: Bool?
    var numOfItems = 2
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView == seperationTableView){
            selectedElement = indexPath.row
            tableView.deselectRow(at: indexPath, animated: true)
            selectedChoiceLabel.isHidden = true
            choicesTableView.reloadData()
        } else if (tableView == choicesTableView){
            selectedChoiceLabel.setTitle("Submit: \(elements[selectedElement!].givenMethods.methods[indexPath.row].methodName)", for: .normal)
            isCorrect = elements[selectedElement!].givenMethods.methods[indexPath.row].isCorrect
            selectedChoiceLabel.isHidden = false
            tableView.deselectRow(at: indexPath, animated: true)
            index = indexPath.row
        }
    }
    
    var index = 0
    
    @IBAction func submitChoice(_ sender: Any) {
        isWrong.isHidden = false
        if (!isCorrect!) {
            isWrong.text = "WRONG"
            isWrong.backgroundColor = .red
            
        } else if (isCorrect!) {
            isWrong.text = "CORRECT"
            isWrong.backgroundColor = .green
            elements.remove(at: index)
        }
        let seconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.isWrong.isHidden = true
        }
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
