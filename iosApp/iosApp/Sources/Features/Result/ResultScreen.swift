//
//  ResultScreen.swift
//  iosApp
//
//  Created by Talha Faki on 26.09.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct ResultScreen: View {
    @Binding var title: String
    @Binding var imageSource: String
    @Binding var description: String
    let bgColor = Color(0xFF3552A2)
    
    var body: some View {
        VStack {
            CustomImageView(urlString: imageSource)
            Spacer()
                .frame(height: 32)
            Text(title)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
                .font(.system(size: 24, weight: .heavy, design: .default))
            
            Spacer()
                .frame(height: 12)
            
            Text(description)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
                .font(.system(size: 16, design: .default))
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .background(bgColor)
    }
}
