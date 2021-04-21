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
        readDataFromDatabase()
    
        
        GMSServices.provideAPIKey( "AIzaSyAftvv6Ll5T8usyYvIKiYc03yS7rbq3Cms" )
        
        return true
    }
    
    
    func readDataFromDatabase(){
        
        people.removeAll()
        
        var db : OpaquePointer? = nil
        
        if sqlite3_open(self.databasepath, &db) ==  SQLITE_OK {
            
            print("Successfully opened connection to database at \(self.databasepath)")
            
            
            
        }
        else {
            print("Unable to open database")
        }
        
        
    }
    
    
    func insertIntoDatabase(person : Data) -> Bool {
        var db : OpaquePointer? = nil
        var returnCode : Bool = true
        
        if  sqlite3_open(self.databasepath, &db) == SQLITE_OK {
            
            var insertStatement : OpaquePointer? = nil
            var insertStatementString : String = "insert into entries values(NULL,?,?,?,?)"
            
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                
                let nameStr = person.name! as NSString
                let emailStr = person.email! as NSString
                let userNameStr = person.username! as NSString
                let userPassStr = person.upassword! as NSString
                
                
                sqlite3_bind_text(insertStatement, 1, nameStr.utf8String  , -1, nil)
                sqlite3_bind_text(insertStatement, 2, emailStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, userNameStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, userPassStr.utf8String, -1, nil)
                
                if sqlite3_step(insertStatement) == SQLITE_DONE{
                    
                    let rowID = sqlite3_last_insert_rowid(db)
                    print("Successfully inserted row \(rowID)")
                }
                else{
                    print("could not insert row")
                    returnCode = false
                }
                sqlite3_finalize(insertStatement)
                
              
                
            }
            else {
                print("Insert statement could not be prepared")
                returnCode = false
            }
            sqlite3_close(db)
            
        }
        else{
            print("Unable to open database")
            returnCode = false
        }
        
        
        
        return returnCode
    }
    
    
    
    
    func checkAndCreateDatabase() {
        var success = false
        let fileManager = FileManager.default
        
        success = fileManager.fileExists(atPath: databasepath!)
        
        if success {
            
            return
        }
        
        let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName!)
        
        try? fileManager.copyItem(atPath: databasePathFromApp!, toPath:databasepath! )
        
    
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

