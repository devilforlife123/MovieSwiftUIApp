//
//  NetworkServiceProtocol.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
  func fetch<T>(type:T.Type,url:EndPoints, page:Int?)->AnyPublisher<T,Error> where T:Decodable
}
