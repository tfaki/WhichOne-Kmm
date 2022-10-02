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
    var clicked: (() -> Void)
    
    var body: some View {
        VStack {
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: imageSource)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.purple.opacity(0.1)
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 250,
                    maxHeight: 450
                )
                .cornerRadius(10)
                .padding(EdgeInsets(top: 18, leading: 8, bottom: 0, trailing: 8))
            } else {
                WhichOneImage(urlString: imageSource)
            }

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
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 0, trailing: 12))
            
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
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 0, trailing: 12))
            
            
            Spacer()
            
            Button(action: clicked) {
                        HStack {
                            Text("AGAIN")
                        }
                        .foregroundColor(Color("SolidBlue"))
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 0,
                            maxHeight: 50
                        )
                        .background(Color.white)
                        .font(.system(size: 16, weight: .heavy, design: .default))
                        .cornerRadius(8)
                        .padding(EdgeInsets(top: 0, leading: 12, bottom: 18, trailing: 12))
                    }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .background(Color("SolidBlue"))
    }
}
