//
//  MovieList.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 17/4/2024.
//

import Foundation
import SwiftUI

struct MovieList:View {

  @State private var showSheet = false
  @ObservedObject private var viewModel: MovieListViewModel
  
  init(service: NetworkServiceProtocol, screenName: ScreenNames) {
      _viewModel = ObservedObject(wrappedValue: MovieListViewModel(service: service, screenName: screenName))
  }

  var body: some View {
    VStack {
      MovieListView(movies: $viewModel.filteredMovies) { movieViewModel in
        viewModel.shouldLoadMore(movie:movieViewModel)
      }

    }
    .onAppear(perform: {
      Task {
        fetchMovieList()
      }
    }).background(Color("37_37_42"))
      .navigationTitle(viewModel.screenName)
      .toolbar(content: {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
            showSheet.toggle()
          }, label: {
            Image(systemName: "line.3.horizontal.decrease.circle")
          }).fullScreenCover(isPresented: $showSheet, content: {
            FilterView(selectedSortType: viewModel.filterOptions.1 ?? .date,selectedRatingFilter:viewModel.filterOptions.0 ?? Ratings.none) { sortType, rating in
              viewModel.filterMovie(rating,sortType)
            }
          })
        }
      })
  }

  func fetchMovieList() {
    self.viewModel.getMovieList()
  }
}
