//
//  DeveloperCenterViewController.swift
//  CATmistry
//
//  Created by Wang Zerui on 23/1/21.
//

import UIKit

class DeveloperCenterViewController: UIViewController {

    @IBOutlet weak var userdefaultString: UITextField!
    @IBOutlet weak var userdefaultInt: UITextField!
    @IBOutlet weak var userdefaultBool: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitString(_ sender: Any) {
        ud.setValue(get(), forKey: userdefaultString.text ?? "none")
    }
    
    @IBAction func submitInt(_ sender: Any) {
        ud.setValue(Int(get()), forKey: userdefaultInt.text ?? "none")
    }
    
    @IBAction func submitBool(_ sender: Any) {
        let ac = UIAlertController(title: "Choose", message: nil, preferredStyle: .alert)
        var truefalse = true
        let submitTrue = UIAlertAction(title: "True", style: .default, handler: {_ in truefalse=true})
        let submitFalse = UIAlertAction(title: "False", style: .default, handler: {_ in truefalse=false})
        ac.addAction(submitTrue)
        ac.addAction(submitFalse)
        ud.setValue(truefalse, forKey: userdefaultBool.text ?? "none")
    }
    
    @IBAction func crashAppButton(_ sender: Any) {
        fatalError()
    }
    
    func get() -> String {
        let ac = UIAlertController(title: "Enter value: ", message: nil, preferredStyle: .alert)
        ac.addTextField()
        var tmp = ""
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            tmp = answer.text ?? ""
        }
        
                
        ac.addAction(submitAction)
        
        present(ac, animated: true)
        
        return tmp
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
