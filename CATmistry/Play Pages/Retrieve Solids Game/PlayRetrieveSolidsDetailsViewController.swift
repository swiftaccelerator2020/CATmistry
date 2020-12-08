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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var choicesTableView: UITableView!
    @IBOutlet weak var selectedChoiceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.tableFooterView = UIView()
        choicesTableView.dataSource = self
        choicesTableView.delegate = self
        self.choicesTableView.allowsSelection = true
        self.choicesTableView.tableFooterView = UIView()
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "loremIpsum", for: indexPath)
        cell.textLabel?.text = "\(elements[indexPath.row].name) - \(elements[indexPath.row].properties)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return elements.count
    }
    var selectedElement: Int?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedElement = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    // MARK: - Second Table View
    
    func choicesTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "loremIpsum2", for: indexPath)
        cell.textLabel?.text = elements[selectedElement!].givenMethods.methods[indexPath.row].methodName
        return cell
    }
    
    func choicesTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return selectedElement ?? 0
    }
    
    func choicesTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedChoiceLabel.text = elements[selectedElement!].givenMethods.methods[indexPath.row].methodName
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
