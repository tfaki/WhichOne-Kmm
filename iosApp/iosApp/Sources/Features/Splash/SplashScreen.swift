//
//  SplashScreen.swift
//  iosApp
//
//  Created by Talha Faki on 27.09.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import shared

struct SplashScreen: View {
    
    @State var isActive: Bool = false
    var isShowForceUpdate = false
    private let networkModule = NetworkModule()
    
    init(appDelegate: AppDelegate) {
        isShowForceUpdate = appDelegate.isShowForceUpdate
    }
    
    var body: some View {
        VStack {
            if self.isActive {
                if isShowForceUpdate {
                    ForceUpdateScreen()
                } else {
                    SurveyScreen(remoteClient: networkModule.remoteClient)
                }
            } else {
                ZStack {
                    Image("splash-logo")
                        .resizable()
                        .frame(width: 175, height: 175, alignment: .center)
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .background(Color("SolidBlue"))
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(Color("SolidBlue"))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
        
}
