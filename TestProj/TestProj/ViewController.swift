//
//  ViewController.swift
//  TestProj
//
//  Created by Piyush Agrawal on 12/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txt : UITextField!
    
    var api_call = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func validation() {
        if let text = txt.text, text.isEmpty {
            return
        }
        let pattern = "[0-9]*"
        let isNumber =  NSPredicate(format:"SELF MATCHES %@", pattern)
        
        if isNumber.evaluate(with: txt.text!) {
            api_call = Int(txt.text!)!
        }
        
        
    }
    
    @IBAction func go_press() {
        self.validation()
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail" {
            let dest = segue.destination as! SecondVC
            dest.api_number = self.api_call
        }
    }
    
    


}

