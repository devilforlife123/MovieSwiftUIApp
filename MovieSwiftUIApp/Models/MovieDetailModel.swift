//
//  MovieDetailModel.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation

class MovieDetailModel:Decodable {
  var adult: Bool?
  var backdrop_path: String?
  var budget: Int?
  var genres: [Genre]?
  var homepage: String?
  var id: Int?
  var original_language, original_title, overview: String?
  var popularity: Double?
  var poster_path: String?
  var production_companies: [ProductionCompany]?
  var release_date: String?
  var revenue: Int?
  var status, tagline, title: String?
  var vote_average: Double?
  var vote_count: Int?
  var runtime: Int?

  init(name: String, voteAverage: Double? = nil) {
      self.title = name
      self.vote_average = voteAverage
  }
}

class ProductionCompany: Decodable {
    var id: Int?
    var logoPath, name, originCountry: String?
}
