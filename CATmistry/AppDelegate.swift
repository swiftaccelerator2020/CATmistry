//
//  AppDelegate.swift
//  CATmistry
//
//  Created by N HJ on 27/11/20.
//

import UIKit
import Firebase
import FirebaseDatabase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    override init() {
        super.init()
        
        FirebaseApp.configure()

        var ref: DatabaseReference!

        ref = Database.database().reference(withPath: "learnTopics")
        
        ref!.observe(.value, with: { (snapshot) in
            
            let jsonData = try! JSONSerialization.data(withJSONObject: snapshot.value!, options: .prettyPrinted)
            
            learnTopics = try! JSONDecoder().decode([Topic].self, from: jsonData)

        })
        

            
        let ud = UserDefaults.standard
        let isDyslexic = ud.bool(forKey: "dyslexic")
        
        if isDyslexic == true {
            UIFont.overrideInitialize()
        }
    }
    
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
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
