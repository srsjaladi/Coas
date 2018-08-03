//
//  AppDelegate.swift
//  Coas
//
//  Created by Sivaramsingh on 26/07/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import Applozic

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var leftMenu : LeftMenuTVC?
    static var appdelegate = AppDelegate()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        CurrentUser.sharedInstance.load()
    
        ALApplozicSettings.setColorForSendMessages(UIColor(red: 213/255, green: 0.0/255, blue: 0.0/255, alpha:1))
        ALApplozicSettings.setColorForReceiveMessages(UIColor(red: 255.0/255, green: 255.0/255, blue: 255.0/255, alpha:1))
        ALApplozicSettings.setUserProfileHidden(false)
        ALApplozicSettings.hideRefreshButton(false)
        ALApplozicSettings.setStatusBarBGColor(UIColor.black)
        ALApplozicSettings.setStatusBarStyle(UIStatusBarStyle.lightContent)
        ALApplozicSettings.setMsgTextViewBGColor(UIColor.clear)
        ALApplozicSettings.setTitleForConversationScreen("CHATS")
        ALApplozicSettings.setGroupOption(false)
        ALUserDefaultsHandler.setBottomTabBarHidden(false)
        ALApplozicSettings.setColorForNavigationItem(UIColor.white)
        ALApplozicSettings.setColorForNavigation(UIColor.clear)
        ALApplozicSettings.setFontFace("Oswald-Medium")
        ALApplozicSettings.setColorForSendButton(UIColor(red: 213/255, green: 0.0/255, blue: 0.0/255, alpha:1))
        ALApplozicSettings.setDefaultGroupType(Int(PRIVATE.rawValue))
        ALApplozicSettings.setAudioVideoEnabled(true)
        ALApplozicSettings.setNotificationTitle("Chats")
        ALApplozicSettings.setFilterContactsStatus(true)
        //Register Notifications
        let settings = UIUserNotificationSettings.init(types: [.alert, .badge, .sound], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(settings)
        UIApplication.shared.registerForRemoteNotifications()
        
        // Override point for customization after application launch.
        let alApplocalNotificationHnadler : ALAppLocalNotifications =  ALAppLocalNotifications.appLocalNotificationHandler();
        alApplocalNotificationHnadler.dataConnectionNotificationHandler();
        
        if (launchOptions != nil)
        {
            let dictionary = launchOptions?[UIApplicationLaunchOptionsKey.remoteNotification] as? NSDictionary
            
            if (dictionary != nil)
            {
                print("launched from push notification")
                let alPushNotificationService: ALPushNotificationService = ALPushNotificationService()
                
                let appState: NSNumber = NSNumber(value: 0 as Int32)
                let applozicProcessed = alPushNotificationService.processPushNotification(launchOptions,updateUI:appState)
                if (!applozicProcessed)
                {
                    //Note: notification for app
                }
            }
        }
        
        UITabBarItem.appearance()
            .setTitleTextAttributes(
                [NSAttributedStringKey.font: UIFont(name: "Oswald-Bold", size: 10)!],
                for: .normal)

        UIApplication.shared.statusBarStyle = .lightContent
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
        
        print("APP_ENTER_IN_BACKGROUND")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "APP_ENTER_IN_BACKGROUND"), object: nil)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
        ALPushNotificationService.applicationEntersForeground()
        print("APP_ENTER_IN_FOREGROUND")
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "APP_ENTER_IN_FOREGROUND"), object: nil)
        UIApplication.shared.applicationIconBadgeNumber = 0
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        ALDBHandler.sharedInstance().saveContext()
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    {
        
        print("Device token data :: \(deviceToken.description)")
        var deviceTokenString: String = ""
        for i in 0..<deviceToken.count
        {
            deviceTokenString += String(format: "%02.2hhx", deviceToken[i] as CVarArg)
        }
        
        print("Device token :: \(deviceTokenString)")
        
        if (ALUserDefaultsHandler.getApnDeviceToken() != deviceTokenString)
        {
            let alRegisterUserClientService: ALRegisterUserClientService = ALRegisterUserClientService()
            alRegisterUserClientService.updateApnDeviceToken(withCompletion: deviceTokenString, withCompletion: { (response, error) in
                if error != nil {
                   
                }
                print("Registration Response :: \(response!)")
            })
        }
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        print("Received notification :: \(userInfo.description)")
        let alPushNotificationService: ALPushNotificationService = ALPushNotificationService()
        alPushNotificationService.notificationArrived(to: application, with: userInfo)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        print("Received notification With Completion :: \(userInfo.description)")
        let alPushNotificationService: ALPushNotificationService = ALPushNotificationService()
        
        alPushNotificationService.notificationArrived(to: application, with: userInfo)
        completionHandler(UIBackgroundFetchResult.newData)
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

