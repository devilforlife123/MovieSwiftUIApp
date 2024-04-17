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
  let service:NetworkServiceProtocol

  init(service: NetworkServiceProtocol) {
    _viewModel = ObservedObject(wrappedValue: HomeViewModel(service:service))
    self.service = service
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
                    MovieList(service: self.service, screenName:ScreenNames.genre(item.genreName, item.genreID))
                  } label: {
                    HorizontalSliderCardView(nameAndId: (item.genreName, item.genreID), cardColor: Color.generateRandomColor())
                  }

                }
              }).padding([.leading, .trailing], 20)
            }.padding([.bottom], 20)
            Rectangle()
                .frame(height: 1, alignment: .center)
                .foregroundColor(.gray)
                .padding([.leading, .trailing], 120)
          }).task {
            fetchGenres()
          }

          HorizontalMovieSliderView(movies: $viewModel.popularMovies, sliderType: .popular).task {
            fetchPopularMovies()
          }.accessibilityIdentifier("PopularMoviesSlider")

          HorizontalMovieSliderView(movies: $viewModel.trendingMovies, sliderType: .trending).task {
            fetchTrendingMovies()
          }.accessibilityIdentifier("TrendingMoviesSlider")

          HorizontalMovieSliderView(movies: $viewModel.topRatedMovies, sliderType: .topRated).task {
            fetchTopRatedMovies()
          }.accessibilityIdentifier("TrendingMoviesSlider")

        }
        .background(Color("37_37_42"))
        .navigationBarTitle("Home", displayMode: .inline)
      }.accentColor(.white)
    }
  }

  private func fetchPopularMovies() {
    viewModel.getPopularMovies()
  }

  private func fetchGenres() {
    viewModel.getGenres()
  }

  private func fetchTrendingMovies() {
    viewModel.getTrendingMovies()
  }

  private func fetchTopRatedMovies() {
    viewModel.getTopRatedMovies()
  }
}
