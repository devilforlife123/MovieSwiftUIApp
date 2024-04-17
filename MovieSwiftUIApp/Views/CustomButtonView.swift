//
//  CustomButtonView.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 17/4/2024.
//

import Foundation
import SwiftUI

struct CustomButtonView :View {
  let completion: (() -> Void)?
  let title: String
  let titleColor: Color = .white
  let backgroundColor: Color
  let cornerRadius: CGFloat
  let height: CGFloat = 10
  @Binding var isAnimating: Bool

  var body: some View {
    Button{
      completion?()
    } label: {
      if isAnimating {
        ActivityIndicator(isAnimating: $isAnimating, style: .medium)
            .frame(height: height)
      } else {
        Text(title).fontWeight(.semibold)
            .frame(height: height)
      }
    }
    .padding()
    .foregroundColor(titleColor)
    .background(backgroundColor)
    .cornerRadius(cornerRadius)

  }
}
