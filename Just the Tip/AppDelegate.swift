//
//  AppDelegate.swift
//  Just the Tip
//
//  Created by Mushaheed Kapadia on 8/11/17.
//  Copyright © 2017 Mushaheed Kapadia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let residualBillTimestampKey = "residualBillTimestampKey"

    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        let timestamp = Double(NSDate().timeIntervalSince1970)
        
        let defaults = UserDefaults.standard
        defaults.set(timestamp, forKey: residualBillTimestampKey)
        defaults.synchronize()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        let defaults = UserDefaults.standard
        let lastTimestamp = defaults.double(forKey: residualBillTimestampKey)
        
        
        
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        let timestamp = Double(NSDate().timeIntervalSince1970)
        
        let defaults = UserDefaults.standard
        defaults.set(timestamp, forKey: residualBillTimestampKey)
        defaults.synchronize()
    }


}

