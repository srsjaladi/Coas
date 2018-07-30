//
//  AppDelegate.swift
//  Coas
//
//  Created by Sivaramsingh on 26/07/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var leftMenu : LeftMenuTVC?
    static var appdelegate = AppDelegate()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        UITabBarItem.appearance()
            .setTitleTextAttributes(
                [NSAttributedStringKey.font: UIFont(name: "Oswald-Bold", size: 10)!],
                for: .normal)
        
        
        UINavigationBar.appearance().barStyle = .blackOpaque
        
        self.setStyles()
        return true
    }
    
    func setStyles() {
        //NavBar Style
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font: UIFont.dinProBold(20), NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().tintColor = UIColor.sandyBrownColor()
        UINavigationBar.appearance().shadowImage = UIImage.imageWithColor(UIColor.whiteThree())
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().backgroundColor = UIColor.white
        UINavigationBar.appearance().isTranslucent = false
        
        
        
        //BarButtonItem
        var attributes = [ NSAttributedStringKey.font: UIFont.dinProMedium(17), NSAttributedStringKey.foregroundColor: UIColor.oldPinkColor()]
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: UIControlState())
        attributes = [ NSAttributedStringKey.font: UIFont.dinProMedium(17), NSAttributedStringKey.foregroundColor: UIColor.oldPinkColor()]
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: .disabled)
        
        UIRefreshControl.appearance().tintColor = UIColor.sandyBrownColor()
        
        if #available(iOS 10.0, *) {
            UITabBar.appearance().unselectedItemTintColor = UIColor.black
        } else {
            // Fallback on earlier versions
        }
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
    
    
    func goToHome(_ animated: Bool?, afterLaunchScreen: Bool = false)
    {
        
        let leftMenuTVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "LeftMenuTVC") as! LeftMenuTVC
        
        var middleVC : UIViewController
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        middleVC = vc
        
        self.leftMenu = leftMenuTVC
        let navigationController = UINavigationController(rootViewController: middleVC)
        
        let slideMenuController = SlideMenuController(mainViewController:navigationController, leftMenuViewController:  self.leftMenu! )
        if ((animated) != nil) {
            UIView.transition(with: self.window!, duration: 0.3, options: UIViewAnimationOptions.transitionCrossDissolve, animations: { () -> Void in
                self.window?.rootViewController = slideMenuController
            }, completion: nil)
        }
        else {
            self.window?.rootViewController = slideMenuController
        }
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
    }
    
    func goToLogin(_ animated: Bool) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! UINavigationController
        
        if (animated) {
            UIView.transition(with: self.window!, duration: 0.3, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
                self.window?.rootViewController = vc
            }, completion: nil)
        }else{
            UIView.transition(with: self.window!, duration: 0.3, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                self.window?.rootViewController = vc
            }, completion: nil)
        }
        
    }
    
    
    static func appDelegate() -> AppDelegate{
        DispatchQueue.main.async() {
            appdelegate = UIApplication.shared.delegate as! AppDelegate
        }
        return appdelegate
    }

    
    func disableLeftSlide( _ shouldDisable : Bool ) {
        
        (self.window?.rootViewController as? SlideMenuController)?.disableLeftSlide(shouldDisable)
    }

}

