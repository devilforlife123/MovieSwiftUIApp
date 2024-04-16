//
//  NetworkManager.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation

class NetworkManager:ObservableObject {

  @Published var service:NetworkServiceProtocol = {
    var isRunningTests: Bool {
        return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }
    return isRunningTests ? MockWebService() : Webservice()
  }()
}
