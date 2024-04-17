//
//  MovieListView.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 17/4/2024.
//

import Foundation
import SwiftUI

struct MovieListView:View {

  @Binding var movies:[MovieViewModel]
  var onAppearCompletion:((MovieViewModel)->())?

  var body: some View {
    List(movies, id: \.id) { movie in
      ZStack(content: {
        MovieListCardView(movie: movie).onAppear(perform: {
            onAppearCompletion?(movie)
        })
        NavigationLink {
          MovieDetail(service:NetworkManager().service,movieId:movie.id)
        } label: {
          EmptyView()
        }

      }).listRowBackground(Color("37_37_42"))
    }
    .background(Color.black)
    .listStyle(.plain)
    .listRowSeparator(.hidden)
  }
}
