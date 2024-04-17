//
//  MovieListServiceProtocol.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation
import Combine

typealias MovieListServiceCompletion = (_ result:Result<[MovieViewModel],Error>)->()

protocol MovieListServiceProtocol:AnyObject {
  func getMovies(cancellables:inout Set<AnyCancellable>, endPoint:EndPoints,page:Int?, completion:@escaping MovieListServiceCompletion)
}
