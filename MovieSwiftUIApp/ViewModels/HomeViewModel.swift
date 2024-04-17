//
//  HomeViewModel.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel:ObservableObject {

  @Published var genres:[GenresViewModel] = []
  @Published var popularMovies:[MovieViewModel] = []
  @Published var trendingMovies:[MovieViewModel] = []
  @Published var topRatedMovies:[MovieViewModel] = []
  private var service:NetworkServiceProtocol
  private var cancellables = Set<AnyCancellable>()

  private lazy var genreService:GenreServicesProtocol = {
    let client = GenreService(service:service)
    return client
  }()

  private lazy var movieService:MovieListServiceProtocol = {
    let client = MovieService(service:service)
    return client
  }()

  init(service:NetworkServiceProtocol) {
    self.service = service
  }

  func getGenres() {
    self.genreService.getGenres(cancellables: &cancellables) { result in
      switch result {
      case .success(let genres):
        self.genres = genres
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

  func getTrendingMovies() {
    self.movieService.getMovies(cancellables: &cancellables, endPoint: EndPoints.trending, page: nil) { result in
      switch result {
      case .success(let movies):
        self.trendingMovies = movies
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

  func getPopularMovies() {
    self.movieService.getMovies(cancellables: &cancellables, endPoint: EndPoints.popular, page: nil) { result in
      switch result {
      case .success(let movies):
        self.popularMovies = movies
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

  func getTopRatedMovies() {
    self.movieService.getMovies(cancellables: &cancellables, endPoint: EndPoints.topRated, page: nil) { result in
      switch result {
      case .success(let movies):
        self.topRatedMovies = movies
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}
