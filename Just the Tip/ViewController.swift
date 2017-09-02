//
//  ViewController.swift
//  Just the Tip
//
//  Created by Mushaheed Kapadia on 8/11/17.
//  Copyright © 2017 Mushaheed Kapadia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    
    let residualBillValueKey = "residualBilValue"
    let residualBillTimestampKey = "residualBillTimestamp"
    let tenMinutesInSeconds = Double(600)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // load residual bill timestamp
        let currentTimestamp = NSDate()
        
        let defaults = UserDefaults.standard
        let lastTimestamp = NSDate(timeIntervalSince1970: defaults.double(forKey: residualBillTimestampKey))
        
        let elapsedTime = currentTimestamp.timeIntervalSince(lastTimestamp as Date)
        
        if (elapsedTime < tenMinutesInSeconds) {
            // hasn't been 10 minutes, load up residual bill value
            let residualBillValue = defaults.double(forKey: residualBillValueKey)
            billField.text = String(format: "%.2f", residualBillValue)
        }
        
        billField.becomeFirstResponder()
        calculateTip(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let timestamp = Double(NSDate().timeIntervalSince1970)
        let residualBillValue = Double(billField.text!) ?? 0
        let defaults = UserDefaults.standard
        defaults.set(timestamp, forKey: residualBillTimestampKey)
        defaults.set(residualBillValue, forKey: residualBillValueKey)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        billField.text = ""
        calculateTip(self)
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        let tipPercentage = Double(defaults.integer(forKey: "default_tip")) / 100
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentage
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}

