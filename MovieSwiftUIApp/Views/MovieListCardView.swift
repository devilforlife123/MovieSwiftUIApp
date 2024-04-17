//
//  MovieListCardView.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 17/4/2024.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct MovieListCardView:View {

  let movie:MovieViewModel

  var body: some View {
    HStack(content: {
      WebImage(url: URL(string: movie.imageUrl)).onSuccess { image, data, cacheType in
      }.resizable()
        .frame(width: 100, height: 150, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: [.black, .gray, .white]), startPoint: .bottomTrailing, endPoint: .topLeading))
        .cornerRadius(20)
      VStack(alignment: .leading) {
          Text(movie.name)
              .fontWeight(.bold)
              .foregroundColor(Color.white)
              .multilineTextAlignment(.leading)
              .lineLimit(2)
              .padding([.bottom], 2)
          Text(movie.overview)
              .fontWeight(.regular)
              .foregroundColor(Color.white)
              .multilineTextAlignment(.leading)
              .lineLimit(4)
              .padding([.bottom], 2)
          HStack(spacing: 0) {
              Text(movie.releaseDate)
                  .font(.body)
                  .fontWeight(.regular)
                  .foregroundColor(Color.gray)
                  .multilineTextAlignment(.leading)
                  .lineLimit(1)
              Spacer()
              if let ratingString = movie.ratingString {
                  Image("starIcon")
                      .frame(width: 30, height: 30)
                  Text(ratingString)
                      .fontWeight(.semibold)
                      .foregroundColor(Color(red: 1.0, green: 0.757, blue: 0.027))
                      .lineLimit(1)
                      .frame(height: 30)
              }
          }
      }
      Spacer()
    })
    .listRowBackground(Color.clear)
    .padding([.bottom], 6)
    .background(Color("37_37_42"))

  }
}
