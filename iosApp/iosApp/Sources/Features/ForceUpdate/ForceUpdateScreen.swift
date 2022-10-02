//
//  ForceUpdateScreen.swift
//  iosApp
//
//  Created by Talha Faki on 2.10.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct ForceUpdateScreen: View {
    
    var body: some View {
        VStack {
            
            LottieView(name: "force-update", loopMode: .loop)
                .frame(height: 250)
            
            Text("New version available")
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
                .font(.system(size: 20, weight: .heavy, design: .default))
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 0, trailing: 12))
            
            Text("Please, update app to new version to continue reposting.")
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
                .font(.system(size: 16, design: .default))
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 0, trailing: 12))
            
            Spacer()
            
            WOButton(buttonText: "Go To App Store", clicked: {
                if let url = URL(string: "itms-apps://itunes.apple.com/app/id1629135515") {
                    UIApplication.shared.open(url)
                }
            })
            
            Spacer()
                .frame(height: 16)
        }
        .background(Color("SolidBlue"))
    }
}
