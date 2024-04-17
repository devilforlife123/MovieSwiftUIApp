//
//  MovieSort.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 17/4/2024.
//

import Foundation

protocol Specification {
  associatedtype Item
  func isSatisfied(_ item:Item) -> Bool
}

class MovieGenreSpecification:Specification {

  let genre:GenresViewModel

  init(genre:GenresViewModel) {
    self.genre = genre
  }

  typealias Item = MovieViewModel

  func isSatisfied(_ item:MovieViewModel) -> Bool {
    item.genres.contains(genre.genreID)
  }
}

class MovieRatingSpecification:Specification {
  func isSatisfied(_ item: MovieViewModel) -> Bool {
    return ratingEnum == item.ratingEnum
  }
  
  typealias Item = MovieViewModel

  let ratingEnum:Ratings

  init(ratingEnum:Ratings) {
    self.ratingEnum = ratingEnum
  }
}
