//
//  ForceUpdateChecker.swift
//  iosApp
//
//  Created by Talha Faki on 30.09.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import Firebase

protocol OnUpdateNeededListener {
    func onUpdateNeeded()
    func onNoUpdateNeeded()
}

class ForceUpdateChecker {

    static let TAG = "ForceUpdateChecker"

    static let FORCE_UPDATE_STORE_URL = "force_update_store_url_ios"
    static let FORCE_UPDATE_CURRENT_VERSION = "force_update_current_version_ios"
    static let FORCE_UPDATE_REQUIRED = "force_update_required_ios"
    
    var listener : OnUpdateNeededListener

    init(listener : OnUpdateNeededListener) {
        self.listener = listener
    }

    func check(){
        let remoteConfig = RemoteConfig.remoteConfig()
        let forceRequired = remoteConfig[ForceUpdateChecker.FORCE_UPDATE_REQUIRED].boolValue

        print("\(ForceUpdateChecker.TAG) : forceRequired : \(forceRequired)")
        
        if(forceRequired == true){

            let currentVersion = remoteConfig[ForceUpdateChecker.FORCE_UPDATE_CURRENT_VERSION].stringValue
            print("\(ForceUpdateChecker.TAG) : currentVersion: \(currentVersion!)")

            if(currentVersion != nil){
                let appVersion = getAppVersion()

                if( currentVersion != appVersion){

                    let url = remoteConfig[ForceUpdateChecker.FORCE_UPDATE_STORE_URL].stringValue
                    if(url != nil){
                        listener.onUpdateNeeded()
                    }
                }
                else {
                    listener.onNoUpdateNeeded()
                }
            }
            else {
                listener.onNoUpdateNeeded()
            }
        } else {
            listener.onNoUpdateNeeded()
        }
    }

    func getAppVersion() -> String {
        let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String

        let version = "\(versionNumber)(\(buildNumber))"

        print("\(ForceUpdateChecker.TAG) : version: \(version)")

        return version
        
    }
}
