//
//  HomeHeaderView.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation
import SwiftUI

struct HomeHeaderView:View {
  
  var title : String
  var withArrow: Bool = true

  var body: some View {
    HStack(){
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
            .foregroundColor(.white)
        Spacer()
        if withArrow {
            Image("chevronRight")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 10, height: 15)
        }
    }.frame(height : 50)
  }
}
