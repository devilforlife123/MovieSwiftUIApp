//
//  SearchView.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation
import SwiftUI

struct SearchView:View {
  init(service: NetworkServiceProtocol) {
  }
  
  var body: some View {
      GeometryReader { g in
          NavigationView {
              VStack {
                  HStack(spacing: 10) {
                  }
                  Spacer()
              }
              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .background(Color("37_37_42"))
              .navigationBarTitle("Search", displayMode: .inline)
          }.accentColor(.white)

      }
  }
}
