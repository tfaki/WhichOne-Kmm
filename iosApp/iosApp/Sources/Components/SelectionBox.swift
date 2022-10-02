//
//  SelectionBox.swift
//  iosApp
//
//  Created by Talha Faki on 30.09.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct SelectionBox: View {
    var selectedChoice: String
    var choice: String
    var questionIndex: Int
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked){
            Text(choice)
                .frame(
                    maxWidth: .infinity
                )
                .padding()
                .foregroundColor(self.selectedChoice == choice + String(questionIndex) ? Color.white : Color("DeepBlue"))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("DeepBlue"), lineWidth: 2))
            
        }
        .background(self.selectedChoice == choice + String(questionIndex) ? Color("DeepGreen") : Color("Transparent"))
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 4, trailing: 8))
    }
}
