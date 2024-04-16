//
//  HomeView.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation
import SwiftUI

struct HomeView:View {

  @ObservedObject private var viewModel:HomeViewModel
  
  init(service: NetworkServiceProtocol) {
    _viewModel = ObservedObject(wrappedValue: HomeViewModel(service:service))
  }

  var body : some View {
    GeometryReader { g in
      // NavigationView
      NavigationView {
        ScrollView {
          VStack(alignment: .leading, content: {
            HomeHeaderView(title: "Genres", withArrow: false).padding([.leading, .trailing], 20)
              .accessibilityIdentifier("GenreHeaderView")
            ScrollView(.horizontal,showsIndicators: false) {
              HStack(spacing: 15, content: {
                ForEach(viewModel.genres, id: \.genreID) { item in
                  NavigationLink {
                  } label: {
                    HorizontalSliderCardView(nameAndId: (item.genreName, item.genreID), cardColor: Color.generateRandomColor())
                  }

                }
              })
            }
          }).task {
            fetchGenres()
          }

        }
        .background(Color("37_37_42"))
        .navigationBarTitle("Home", displayMode: .inline)
      }.accentColor(.white)
    }
  }

  private func fetchGenres() {
    viewModel.getGenres()
  }
}
