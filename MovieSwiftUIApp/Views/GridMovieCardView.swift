//
//  GridMovieCardView.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 17/4/2024.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct GridMovieCardView: View {
  let movie : MovieViewModel
  var cardColor : Color = Color.generateRandomColor()
  var body: some View {
    VStack {
        WebImage(url: URL(string: movie.imageUrl))
            .onSuccess {
              image, data, cacheType in
              
        }
            .resizable()
            .frame(width: 130, height: 130, alignment: .center)
            .background(LinearGradient(gradient: Gradient(colors: [.black, .gray, .white]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
        Text(movie.name)
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .frame(maxWidth: 130)
    }
  }
}
