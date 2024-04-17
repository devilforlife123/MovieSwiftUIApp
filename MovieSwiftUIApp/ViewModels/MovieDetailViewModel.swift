//
//  MovieDetailViewModel.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 17/4/2024.
//

import Foundation
import Combine

class MovieDetailViewModel:ObservableObject {

  @Published var movieDetail:MovieDetailModelViewModel = MovieDetailModelViewModel.default

  private var service: NetworkServiceProtocol
  private var movieId: Int
  private var cancellables = Set<AnyCancellable>()

  lazy private var movieDetailService:MovieDetailServiceProtocol = {
    let client = MovieService(service: service)
    return client 
  }()

  init(service:NetworkServiceProtocol, movieId:Int) {
    self.service = service
    self.movieId = movieId
  }

  func getMovieDetail() {
    self.movieDetailService.getMovieDetail(cancellables: &cancellables, movieID: movieId) { result in
      switch result {
      case .success(let movieDetailViewModel):
        self.movieDetail = movieDetailViewModel
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

}
