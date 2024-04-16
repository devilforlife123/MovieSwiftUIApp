//
//  GenresViewModel.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation

struct GenresViewModel {
  let genre:Genre

  var genreName:String {
    return genre.name
  }

  var genreID:Int {
    return genre.id
  }
  
  static var `default`: GenresViewModel {
      let genre = Genre(name: "Action", id: 1)
      return GenresViewModel(genre: genre)
  }
}
