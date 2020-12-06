//
//  PlayRetrieveSolidsViewController.swift
//  CATmistry
//
//  Created by N HJ on 2/12/20.
//

import UIKit

class PlayRetrieveSolidsDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    // MARK: - Table View
    
    //var elements: [specificSeperationMethod]!
    var elements = [specificSeperationMethod(picture: "", name: "hi there", properties: "no properties")]
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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
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
