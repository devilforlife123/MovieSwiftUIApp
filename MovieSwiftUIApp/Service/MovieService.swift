//
//  MovieService.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation
import Combine

class MovieService:MovieListServiceProtocol {

  var service:NetworkServiceProtocol

  init(service:NetworkServiceProtocol) {
    self.service = service
  }

  func getMovies(cancellables: inout Set<AnyCancellable>, endPoint: EndPoints, page: Int?, completion: @escaping MovieListServiceCompletion) {
    let response = self.service.fetch(type: MovieResponse.self, url: endPoint, page: page)
    response.sink { result  in
      switch result {
      case .finished:
        break
      case .failure(let error):
        completion(.failure(error))
      }
    } receiveValue: { response in
      completion(.success(response.results.map({MovieViewModel.init(movie: $0)})))
    }.store(in: &cancellables)
  }
}
extension MovieService:MovieDetailServiceProtocol {
  func getMovieDetail(cancellables: inout Set<AnyCancellable>, movieID: Int, completion: @escaping (Result<MovieDetailModelViewModel, Error>) -> ()) {
    let response = self.service.fetch(type: MovieDetailModel.self, url: EndPoints.movieDetail(movieID), page: nil)
    response.sink { results in
      switch results {
      case .finished:
        break
      case .failure(let error):
        completion(.failure(error))
      }
    } receiveValue: { movieDetailModel in
      completion(.success(MovieDetailModelViewModel(movie: movieDetailModel)))
    }.store(in: &cancellables)
  }
}

extension MovieService:MovieSearchServiceProtocol {
  func getMovies(cancellables: inout Set<AnyCancellable>, page: Int?, searchText: String, completion: @escaping MovieSearchServiceCompletion) {
    let response = self.service.fetch(type: MovieResponse.self, url: EndPoints.search(searchText), page: page)
    response.sink { result in
      switch result {
      case .finished:
        break
      case .failure(let error):
        completion(.failure(error))
      }
    } receiveValue: { movieResponse in
      completion(.success(movieResponse.results.map({MovieViewModel.init(movie: $0)})))
    }.store(in: &cancellables)
  }
}
