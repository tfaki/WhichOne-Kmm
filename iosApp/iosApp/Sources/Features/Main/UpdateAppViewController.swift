//
//  UpdateAppViewController.swift
//  iosApp
//
//  Created by Talha Faki on 30.09.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import UIKit
extension UIViewController {
    func openURL(withURL url : URL ){
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}
