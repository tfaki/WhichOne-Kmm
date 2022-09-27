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
    
    @State var isActive:Bool = false
    private let networkModule = NetworkModule()
    let bgColor = Color(0xFF3552A2)
    
    var body: some View {
        VStack {
            if self.isActive {
                SurveyScreen(remoteClient: networkModule.remoteClient)
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
                .background(bgColor)
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(bgColor)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
        
}
