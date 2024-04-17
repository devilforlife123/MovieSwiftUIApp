//
//  SearchView.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation
import SwiftUI

struct SearchView:View {

  @State var textFieldText:String = ""
  @ObservedObject private var viewModel:SearchViewModel 

  init(service: NetworkServiceProtocol) {
    _viewModel = ObservedObject(wrappedValue: SearchViewModel(service:service))
  }
  
  var body: some View {
      GeometryReader { g in
          NavigationView {
              VStack {
                  HStack(spacing: 10) {
                    SearchTextField(textFieldText: $textFieldText)
                    CustomButtonView(completion: {
                      Task {
                        fetchSearchMovies()
                      }
                    }, title: "Search", backgroundColor: Color(hue: 0.537, saturation: 0.991, brightness: 0.602), cornerRadius: 12, isAnimating: $viewModel.activityAnimating)
                  }
                  Spacer()
                MovieListView(movies: $viewModel.filteredMovies) { movie in
                  viewModel.shouldLoadMore(movie)
                }
              }
              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .background(Color("37_37_42"))
              .navigationBarTitle("Search", displayMode: .inline)
          }.accentColor(.white)

      }
  }

  private func fetchSearchMovies() {
    viewModel.getMovies(textFieldText)
  }
}
