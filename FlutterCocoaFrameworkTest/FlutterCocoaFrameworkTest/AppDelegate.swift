//
//  AppDelegate.swift
//  FlutterCocoaFrameworkTest
//
//  Created by ksnowlv on 2024/4/17.
//

import UIKit
import Flutter

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

//    lazy var flutterEngine = FlutterEngine(name: "My Flutter engine!")
    
    static let FlutterEngineMaxNum = 2

    let flutterEngineGroup = FlutterEngineGroup(name: "multiple-flutters", project: nil)
    lazy var flutterEngines:[FlutterEngine] = Array()
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        for _ in 0..<AppDelegate.FlutterEngineMaxNum {
            let flutterEngine = flutterEngineGroup.makeEngine(withEntrypoint: "main", libraryURI: nil)
            flutterEngine.run()
            flutterEngines.append(flutterEngine)
        }
  
        return true
    }
    
  

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

