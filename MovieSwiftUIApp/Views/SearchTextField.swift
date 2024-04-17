//
//  SearchTextField.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 17/4/2024.
//

import Foundation
import SwiftUI

struct SearchTextField:View {
  @Binding var textFieldText: String

  var body: some View {
    TextField("", text: $textFieldText)
        .frame(height: 40)
        .padding(.horizontal, 15)
        .accentColor(.white)
        .modifier(PlaceholderStyle(showPlaceHolder: textFieldText.isEmpty, placeholder: "Search movie"))
        .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            )
        .padding(.leading)
        .padding(.top, 5)
  }
}
public struct PlaceholderStyle:ViewModifier {
  var showPlaceHolder:Bool
  var placeholder:String

  public func body(content: Content) -> some View {
    ZStack(alignment: .leading, content: {
      if showPlaceHolder {
          Text(placeholder)
          .padding(.horizontal, 15)
          .foregroundColor(.gray.opacity(0.7))
      }
      content
      .foregroundColor(Color.white)
    })
  }
}
