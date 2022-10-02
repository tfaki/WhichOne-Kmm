//
//  WOErrorView.swift
//  iosApp
//
//  Created by Talha Faki on 2.10.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct WOErrorView: View {
    var clicked: (() -> Void)
    
    var body: some View {
        VStack {
            
            LottieView(name: "opps", loopMode: .loop)
                .frame(height: 350)
            
            Spacer()
                .frame(height: 50)
            
            Text("Something went wrong!")
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
                .font(.system(size: 18, weight: .heavy, design: .default))
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 0, trailing: 12))
            
            Spacer()
            
            WOButton(buttonText: "RETRY", clicked: clicked)
            
            Spacer()
                .frame(height: 16)
        }
        .background(Color("SolidBlue"))
    }
}
