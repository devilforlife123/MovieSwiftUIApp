//
//  Genre.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation

struct GenreResponse:Decodable {
  let genres:[Genre]
}

struct Genre:Decodable {
  let name:String
  let id:Int
}
