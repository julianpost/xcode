//
//  ViewController.swift
//  Target Weight 1
//
//  Created by Julian Post on 6/15/16.
//  Copyright © 2016 Julian Post. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func updateCalculations() {
        let wetWt:Double = Double(wetField.text ?? "0") ?? 0
        let dryWt:Double = Double(dryField.text ?? "0") ?? 0
        let moistureContent = Double(round(10 * ((1 - (dryWt / wetWt)) * 100))/10)
        
        moistureField.text = String(moistureContent) + "%"
        
        let bagWt: Double = Double(emptyBagField.text ?? "0") ?? 0
        let fullBag: Double = Double(fullBagField.text ?? "0") ?? 0
        let targetWt = (fullBag - bagWt) * ((100 - moistureContent)/90) + bagWt
        let targetWtRounded = Double(round(10 * targetWt)/10)
        
        
        if (targetWtRounded < 0) && (fullBag != 0) {
            targetWtField.text = "sure?"
        }
        else if targetWtRounded <= 0 {
            targetWtField.text = ""
        }
        
        else {
        targetWtField.text = String(targetWtRounded)
        }
        
        
    }
    

    
   
    @IBOutlet weak var moistureField: UILabel!
    
    @IBOutlet weak var targetWtField: UILabel!
    
    @IBOutlet weak var wetField: UITextField!
    
    @IBOutlet weak var dryField: UITextField!
    
    @IBOutlet weak var emptyBagField: UITextField!
    
    @IBOutlet weak var fullBagField: UITextField!
    
    
    @IBAction func updateOnFieldChange(sender: UITextField) {
        updateCalculations()
    }
    
}

