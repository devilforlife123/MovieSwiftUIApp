//
//  MovieViewModel.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation

enum Ratings:String, SegmentBindable {
  case none = "All"
  case belowFive = "<5"
  case betweenFiveAndSeven = "5-7"
  case aboveSeven = ">7"
  var description: String {
    return "\(self.rawValue)"
  }
}

struct MovieViewModel {
  let movie:Movie
  var name:String {
    return movie.title
  }

  var id:Int {
    return movie.id
  }

  var ratingEnum:Ratings {
    let rating = movie.vote_average
    if rating >= 0.0, rating < 5.0 {
      return .belowFive
    } else if rating >= 5.0, rating <= 7.0 {
      return .betweenFiveAndSeven
    } else if rating > 7.0, rating <= 10.0 {
      return .aboveSeven
    } else {
      return Ratings.none
    }
  }

  var rating: Double {
      movie.vote_average
  }

  var ratingString: String? {
      return  movie.vote_average != 0.0 ? String(format: "%.1f", movie.vote_average) : nil
  }

  var imageUrl: String {
      return "https://image.tmdb.org/t/p/w500" + (movie.poster_path ?? "")
  }

  var overview: String {
      movie.overview ?? ""
  }

  var genres: [Int] {
      movie.genre_ids
  }

  var releaseDate: String {
      movie.release_date
  }
}
