//
//  SearchViewModel.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 17/4/2024.
//

import Foundation
import SwiftUI
import Combine

class SearchViewModel:ObservableObject {

  @Published var activityAnimating:Bool = false
  private var movies:[MovieViewModel] = []
  @Published var filteredMovies:[MovieViewModel] = []
  private var searchText = ""
  //Create a task property
  private var task: Task<Void, Never>?
  private var pageNumber = 1
  private var service:NetworkServiceProtocol
  private var cancellables = Set<AnyCancellable>()
  var filterOptions:(Ratings?,SortType?) = (nil,nil)
  private lazy var movieSearchService:MovieSearchServiceProtocol = {
    let client = MovieService(service: service)
    return client
  }()
  let movieFilter = MovieFilter()
  let sorting = MovieSort()

  init(service:NetworkServiceProtocol) {
    self.service = service
  }

  func shouldLoadMore(_ movie:MovieViewModel) {
    if let lastID = filteredMovies.last?.id , movie.id == lastID {
      Task {
        getMovies(self.searchText)
      }
    }
  }

  func getMovies(_ text:String) {
    if self.searchText == text {
      task?.cancel()
      activityAnimating = false
    } else {
      activityAnimating = true
      self.pageNumber = 1
      movies = []
      filteredMovies = []
      self.searchText = text
    }
    guard !text.isEmpty else {
      movies = []
      filteredMovies = []
      task?.cancel()
      activityAnimating = false
      return
    }

    task?.cancel()
    task = Task(operation: {
      guard !Task.isCancelled else {
        activityAnimating = false
        return
      }
      searchText = text
      movieSearchService.getMovies(cancellables: &cancellables, page: pageNumber, searchText: searchText) { result in
        self.activityAnimating = false
        switch result {
        case .success(let movies):
          self.movies.append(contentsOf: movies)
          self.filteredMovies.append(contentsOf: movies)
          self.filterMovie(self.filterOptions.0,sort: nil)
          self.pageNumber += 1
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
    })
  }

  func filterMovie(_ rating:Ratings? = Ratings.none, sort:SortType? = nil) {
    if let rating = rating, rating != Ratings.none {
      filteredMovies = movieFilter.filter(movies, spec: MovieRatingSpecification(ratingEnum: rating))
      filterOptions.0 = rating
    } else {
      filteredMovies = movies
    }
    if let sort = sort {
        filteredMovies = sorting.sort({$0.rating}, filteredMovies)
        filterOptions.1 = sort
    }
  }
}
