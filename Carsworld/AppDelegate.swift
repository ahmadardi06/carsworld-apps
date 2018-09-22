//
//  AppDelegate.swift
//  Carsworld
//
//  Created by carsworld Indonesia on 18/09/18.
//  Copyright © 2018 Carsworld Indonesia. All rights reserved.
//

import UIKit

let warnaAtasMenuBar = UIColor.rgb(red: 37, green: 94, blue: 195)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let warnaCarsworld = UIColor.rgb(red: 54, green: 118, blue: 203)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
//        let layout = UICollectionViewFlowLayout()
//        let homeController = HomeController(collectionViewLayout: layout)
//        window?.rootViewController = UINavigationController(rootViewController: homeController)
        
        let layout = UICollectionViewFlowLayout()
        let loginController = SignInController(collectionViewLayout: layout)
        window?.rootViewController = UINavigationController(rootViewController: loginController)
        
        UINavigationBar.appearance().barTintColor = warnaCarsworld
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        application.statusBarStyle = .lightContent
        
        let statusBarBackground = UIView()
        statusBarBackground.backgroundColor = warnaAtasMenuBar
        
        window?.addSubview(statusBarBackground)
        window?.addConstraintWithFormat(format: "H:|[v0]|", views: statusBarBackground)
        window?.addConstraintWithFormat(format: "V:|[v0(20)]|", views: statusBarBackground)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
       
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }


}

