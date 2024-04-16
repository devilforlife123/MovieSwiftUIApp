//
//  Movie.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [Movie]
}

struct Movie:Decodable {
  var title: String
  var id: Int
  var genre_ids: [Int]
  var vote_average: Double
  var poster_path: String?
  var overview: String?
  var release_date: String
}
