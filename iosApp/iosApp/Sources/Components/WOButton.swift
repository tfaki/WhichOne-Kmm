//
//  WOButton.swift
//  iosApp
//
//  Created by Talha Faki on 2.10.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct WOButton: View {
    var buttonText: String
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
                    HStack {
                        Text(buttonText)
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
}
