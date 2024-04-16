//
//  Webservice.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation
import Combine

class Webservice:NetworkServiceProtocol {
  func fetch<T>(type: T.Type, url: EndPoints, page: Int?) -> AnyPublisher<T, Error> where T : Decodable {
    let urlString = url.url(page: page)
    guard let url = URL(string: urlString) else {
      let error = NSError(domain: "No URL", code: 0, userInfo: [:])
      fatalError(error.localizedDescription)
    }
    return URLSession.shared.dataTaskPublisher(for: url).receive(on: DispatchQueue.main).map(\.data).decode(type: T.self, decoder: JSONDecoder()).eraseToAnyPublisher()
  }
}
