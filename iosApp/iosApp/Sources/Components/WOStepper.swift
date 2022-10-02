//
//  LinearProgressStepper.swift
//  iosApp
//
//  Created by Talha Faki on 30.09.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

struct WOStepper: View {
  var value: Int
  var maximum: Int = 10
  var height: CGFloat = 8
  var spacing: CGFloat = 1
  var unselectedColor: Color = Color.secondary.opacity(0.9)
 
    var body: some View {
    HStack(spacing: spacing) {
      ForEach(0 ..< maximum) { index in
        Rectangle()
          .foregroundColor(index < self.value ? Color("DeepBlue") : Color("Alabaster"))
      }
    }
    .frame(maxHeight: height)
    .clipShape(Capsule())
  }
}
