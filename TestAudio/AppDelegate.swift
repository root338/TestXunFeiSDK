//
//  AppDelegate.swift
//  TestAudio
//
//  Created by DY on 2017/10/25.
//  Copyright © 2017年 DY. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let methodListKey = "appMethodList"
    let currentAppIdentifier    = "\(arc4random()):"

    func writeFunctionName(functionName: String = #function) {
        
        var appMethodList = [Any]()
        
        if let appOldMethodList = UserDefaults.standard.array(forKey: methodListKey) {
            appMethodList += appOldMethodList
        }
        
        appMethodList.append(currentAppIdentifier + functionName)
        
        UserDefaults.standard.set(appMethodList, forKey: methodListKey)
    }
    
    func printMethodList() {
        
        let appOldMethodList = UserDefaults.standard.array(forKey: methodListKey)
        print(appOldMethodList ?? "")
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let param = "appid=59e5d109"
        _ = IFlySpeechUtility.createUtility(param)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let resourceData = app.handleURL(url, options: options)
        
        let isResult = app.pushTargetViewController(fileObj: resourceData)
        
        return isResult;
    }
}

