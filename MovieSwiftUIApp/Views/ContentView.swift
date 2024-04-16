//
//  ContentView.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import SwiftUI

struct ContentView: View {
  private var service: NetworkServiceProtocol = NetworkManager().service
  let coloredNavAppearance = UINavigationBarAppearance()
  @State private var selection = 0
  
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
