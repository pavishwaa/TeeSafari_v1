//
//  AppDelegate.swift
//  TeeSafari_V1
//
//  Created by  on 4/6/21.
//

import UIKit
import GoogleMaps
import SQLite3


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var databaseName : String? = "project.db"
    var databasepath : String?
    var people : [Data] = []



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // for account and login
        
        let documentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)
        
        let documentsDir = documentPaths[0]
        databasepath = documentsDir.appending("/" + databaseName!)
        
        checkAndCreateDatabase()
    
        
        GMSServices.provideAPIKey( "AIzaSyAftvv6Ll5T8usyYvIKiYc03yS7rbq3Cms" )
        
        return true
    }
    
    func checkAndCreateDatabase() {
        var success = false
        let fileManager = FileManager.default
        
        success = fileManager.fileExists(atPath: databasepath!)
        
        if success {
            
            return
        }
        
        let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName!)
        
       //try?  fileManager.copyItem(atPath : databasePathFromApp, toPath: databasepath)
        
        
        return
        
        
        
        
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

