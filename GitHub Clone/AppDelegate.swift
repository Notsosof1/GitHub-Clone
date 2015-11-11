//
//  AppDelegate.swift
//  GitHub Clone
//
//  Created by Cynthia Whitlatch on 11/9/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        return true
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if KeychainService.LoadFromKeychain() == nil {
            if let mainViewController = self.window?.rootViewController as? ViewController, storyboard = mainViewController.storyboard {
                if let loginViewController = storyboard.instantiateViewControllerWithIdentifier("LoginViewcontroller") as? LoginViewcontroller {
                    mainViewController.addChildViewController(loginViewController)
                    mainViewController.view.addSubview(loginViewController.view)
                    
                    loginViewController.didMoveToParentViewController(mainViewController)
                    
                }
            }
        }

        return true
    }
    
    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        OAuth.shared.exchangeCodeInURL(url)
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return true
    }


}

