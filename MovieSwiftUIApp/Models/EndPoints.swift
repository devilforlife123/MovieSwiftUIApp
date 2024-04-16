//
//  EndPoints.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation

enum EndPoints {

  case genre
  case popular
  case trending
  case topRated
  case movieDetail(Int)
  case discoverGenre(String)
  case search(String)

  func url(page: Int? = nil) -> String {

    var baseUrl: String { return "https://api.themoviedb.org/3"}
    var apiToken: String {return "?api_key=f74b7953c0527670d96035f6abfaca67"}
    var paging: String {return page == nil ? "" : "&page=\(page ?? 1)"}

    switch self {
    case .genre:
      return "\(baseUrl)/genre/movie/list" + apiToken
    case .popular:
      return "\(baseUrl)/movie/popular" + apiToken + paging
    case .trending:
      return "\(baseUrl)/trending/movie/week" + apiToken
    case .topRated:
      return "\(baseUrl)/movie/top_rated" + apiToken + paging
    case .movieDetail(let movieId):
      return "\(baseUrl)/movie/\(movieId)" + apiToken
    case .discoverGenre(let genre):
      return "\(baseUrl)/discover/movie" + apiToken + paging + "&with_genres=\(genre)"
    case .search(let searchText):
      return "\(baseUrl)/search/movie" + apiToken + paging + "&query=\(searchText)"
    }
  }
}
