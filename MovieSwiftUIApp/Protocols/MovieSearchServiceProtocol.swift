//
//  MovieSearchMovieProtocol.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 17/4/2024.
//

import Foundation
import Combine

protocol MovieSearchServiceProtocol {
  typealias MovieSearchServiceCompletion = (_ result:Result<[MovieViewModel],Error>) -> ()

  func getMovies(cancellables: inout Set<AnyCancellable>, page:Int?, searchText:String,completion:@escaping MovieSearchServiceCompletion)
}
