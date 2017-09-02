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
    @IBOutlet weak var currentTipPercentage: UILabel!
    
    let residualBillValueKey = "residualBillValue"
    let residualBillTimestampKey = "residualBillTimestampKey"
    let tenMinutesInSeconds = Double(600)
    
    func loadDefaultTip() {
        let defaults = UserDefaults.standard
        let defaultTipPercentage = defaults.integer(forKey: "default_tip")
        currentTipPercentage.text = String.init(format: "(+ %d%%)", defaultTipPercentage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard

        loadDefaultTip()
        
        // load residual bill timestamp
        let currentTimestamp = NSDate()
        
        let lastTimestamp = defaults.double(forKey: residualBillTimestampKey)
        
        let lastTimestampDate = NSDate(timeIntervalSince1970: lastTimestamp)
        
        let elapsedTime = currentTimestamp.timeIntervalSince(lastTimestampDate as Date)
        
        if (elapsedTime < tenMinutesInSeconds) {
            // hasn't been 10 minutes, load up residual bill value
            let residualBillValue = defaults.double(forKey: residualBillValueKey)
            if (residualBillValue > 0){
                billField.text = String(format: "%.2f", residualBillValue)
            }
        }
        

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadDefaultTip()
        billField.becomeFirstResponder()
        calculateTip(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateBillAmount(_ sender: Any) {
        let defaults = UserDefaults.standard
        let bill = Double(billField.text!) ?? 0
        
        defaults.set(bill, forKey: residualBillValueKey)
        defaults.synchronize()
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

