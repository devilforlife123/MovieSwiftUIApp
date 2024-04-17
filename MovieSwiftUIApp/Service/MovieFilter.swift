//
//  MovieFilter.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 17/4/2024.
//

import Foundation

protocol Filter {
  associatedtype Item
  func filter<Spec:Specification>(_ items:[Item], spec:Spec) -> [Item] where Spec.Item == Item
}

class MovieFilter:Filter {
  func filter<Spec>(_ items: [MovieViewModel], spec: Spec) -> [MovieViewModel] where Spec : Specification, MovieViewModel == Spec.Item {
    var movies:[MovieViewModel] = []
    for movie in items {
      if spec.isSatisfied(movie) {
        movies.append(movie)
      }
    }
    return movies
  }
  
  typealias Item = MovieViewModel

}


