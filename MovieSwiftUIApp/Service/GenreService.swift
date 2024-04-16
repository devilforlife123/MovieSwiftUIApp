//
//  GenreService.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation
import Combine

class GenreService {
  var service:NetworkServiceProtocol

  init(service: NetworkServiceProtocol) {
    self.service = service
  }
}

extension GenreService:GenreServicesProtocol {
  func getGenres(cancellables: inout Set<AnyCancellable>, completion: @escaping GenreCompletion) {
    let response = self.service.fetch(type: GenreResponse.self, url: EndPoints.genre, page: nil)
    response.sink { result in
      switch result {
      case .finished:
        break
      case .failure(let error):
        completion(.failure(error))
      }
    } receiveValue: { genreResponse in
      completion(.success(genreResponse.genres.map({GenresViewModel.init(genre: $0)})))
    }.store(in: &cancellables)
  }
}
