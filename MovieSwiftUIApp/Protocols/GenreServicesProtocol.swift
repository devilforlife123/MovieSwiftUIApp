//
//  GenreServicesProtocol.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation
import Combine

protocol GenreServicesProtocol:AnyObject {
  
  typealias GenreCompletion = (_ result:Result<[GenresViewModel],Error>)->()

  func getGenres(cancellables:inout Set<AnyCancellable>, completion:@escaping GenreCompletion)

}
