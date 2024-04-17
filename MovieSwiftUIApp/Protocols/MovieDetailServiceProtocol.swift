//
//  MovieDetailServiceProtocol.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 17/4/2024.
//

import Foundation
import Combine

typealias MovieDetailServiceCompletion = (_ result:Result<MovieDetailModelViewModel,Error>)->()

protocol MovieDetailServiceProtocol:AnyObject {
  func getMovieDetail(cancellables: inout Set<AnyCancellable>, movieID:Int, completion:@escaping MovieDetailServiceCompletion)
}
