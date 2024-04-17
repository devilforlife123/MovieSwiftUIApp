//
//  ScreenNames.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation

enum ScreenNames {
   case popular
  case trending
  case topRated
  case genre(String, Int)

  func getScreenName()->String {
    switch self {
    case .popular:
        return "Popular Movies"
    case .trending:
        return "Trending Movies"
    case .topRated:
        return "Top Rated Movies"
    case .genre(let name, _):
        return "\(name) Movies"
    }
  }

  func getEndPoints()-> EndPoints {
    switch self {
    case .popular:
        return EndPoints.popular
    case .trending:
        return EndPoints.trending
    case .topRated:
        return EndPoints.topRated
    case .genre(_, let genreId):
        return EndPoints.discoverGenre("\(genreId)")
    }
  }
}
