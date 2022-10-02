//
//  AppDelegate.swift
//  iosApp
//
//  Created by Talha Faki on 30.09.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var isShowForceUpdate = false
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        setupRemoteConfig()
        
        ForceUpdateChecker(listener: self).check()
        
        return true
    }
}


extension AppDelegate {
    func setupRemoteConfig(){
        
        var remoteConfig: RemoteConfig!
        
        remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.configSettings = RemoteConfigSettings()
        
        //set in app defaults
        let defaults : [String : Any] = [
            ForceUpdateChecker.FORCE_UPDATE_REQUIRED : false,
            ForceUpdateChecker.FORCE_UPDATE_CURRENT_VERSION : "1.0(1)",
            ForceUpdateChecker.FORCE_UPDATE_STORE_URL : "https://itunes.apple.com/us/app/myapp/id12345678?ls=1&mt=8"
        ]
        
        remoteConfig.setDefaults(defaults as? [String : NSObject])
        
        let expirationDuration = 60
        remoteConfig.fetch(withExpirationDuration: TimeInterval(expirationDuration)) { [weak self] (status, error) in
            if status == .success {
                print("config fetch done")
                remoteConfig.fetchAndActivate()
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
        }
    }
}

extension AppDelegate : OnUpdateNeededListener {
    func onUpdateNeeded() {
        print("onUpdateNeeded()")
        self.isShowForceUpdate = true
    }

    func onNoUpdateNeeded() {
        print("onNoUpdateNeeded()")
        self.isShowForceUpdate = false
    }
}
