//
//  AppDelegate.swift
//  3DTouchQuickAction
//
//  Created by BlessNeo on 2019/6/15.
//  Copyright © 2019 NeoZH. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    enum ShortcutIdentifier: String {
        case First
        case Second
        case Third
        
        init?(fullType: String) {
            guard let last = fullType.components(separatedBy: ".").last else { return nil }
            self.init(rawValue: last)
        }
        
        var type: String {
            return Bundle.main.bundleIdentifier! + ".\(self.rawValue)"
        }
    }

    /*
     官方文档对 UIApplicationShortcutItem 的介绍以及使用很详细
     Dynamic vs. Static Quick Actions
     Although immutable, a UIApplicationShortcutItem instance is considered dynamic to distinguish it from a static quick action you specify at build time.
     
     Define Home screen dynamic quick actions using this class. Your code creates dynamic quick actions, and registers them with your app object, at runtime.
     
     Define Home screen static quick actions in the UIApplicationShortcutItems array in your Xcode project’s Info.plist file, as described in the iOS Keys chapter in Information Property List Key Reference. The system registers your static quick actions when your app is installed.
     
     静态的 3D Touch按钮，在info.plist中添加 UIApplicationShortcutItems 相关内容
     */
    var launchShortcutItem: UIApplicationShortcutItem?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let handledShortcutItem = handleShortcutItem(shortcutItem)
        completionHandler(handledShortcutItem)
    }
    
    func handleShortcutItem(_ shortcutItem: UIApplicationShortcutItem) -> Bool {
        var handled = false
        guard let _ = ShortcutIdentifier(fullType: shortcutItem.type) else { return false }
        guard let shortcutType = shortcutItem.type as String? else { return false }
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        var ctrl: UIViewController
        switch shortcutType {
        case ShortcutIdentifier.First.type:
            ctrl = storyBoard.instantiateViewController(withIdentifier: "Run") as! RunViewController
            handled = true
        case ShortcutIdentifier.Second.type:
            // Handle shortcut 2
            ctrl = storyBoard.instantiateViewController(withIdentifier: "Scan") as! ScanViewController
            handled = true
        case ShortcutIdentifier.Third.type:
            // Handle shortcut 3
            ctrl = storyBoard.instantiateViewController(withIdentifier: "Switch") as! SwitchWiFiViewController
            handled = true
        default:
            ctrl = UIViewController()
            break
        }
        var presentedCtrl: UIViewController = window!.rootViewController!
        while presentedCtrl.presentedViewController != nil {
            presentedCtrl = presentedCtrl.presentedViewController!
            
        }
        if !presentedCtrl.isMember(of: ctrl.classForCoder) {
            presentedCtrl.present(ctrl, animated: true, completion: nil)
        }
        return handled
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


}

