//
//  SettingsViewController.swift
//  Just the Tip
//
//  Created by Mushaheed Kapadia on 8/18/17.
//  Copyright © 2017 Mushaheed Kapadia. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var defaultTipPercentageSlider: UISlider!
    @IBOutlet weak var defaultTipValueLabel: UILabel!
    
    let storedTipKey = "default_tip"
    let labelFormat = "%d%%"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        let storedDefaultTip = defaults.integer(forKey: storedTipKey)
        let sliderValue = storedDefaultTip * 2
        defaultTipValueLabel.text = String.init(format: labelFormat, storedDefaultTip)
        defaultTipPercentageSlider.value = Float(sliderValue) / 100
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateDefaultTipPercentage(_ sender: Any) {
        let sliderValue = Int(defaultTipPercentageSlider.value * 100)
        let defaultTip = sliderValue / 2
        let defaults = UserDefaults.standard
        defaults.set(defaultTip, forKey: storedTipKey)
        defaults.synchronize()
        
        defaultTipValueLabel.text = String.init(format: labelFormat, defaultTip)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
