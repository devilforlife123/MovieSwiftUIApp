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
  private var service:NetworkServiceProtocol
  private var cancellables = Set<AnyCancellable>()

  private lazy var genreService:GenreServicesProtocol = {
    let client = GenreService(service:service)
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
}
