//
//  MovieListViewModel.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 17/4/2024.
//

import Foundation
import SwiftUI
import Combine

class MovieListViewModel:ObservableObject {

  @Published var filteredMovies:[MovieViewModel] = []
  private var movies:[MovieViewModel] = []
  private var service:NetworkServiceProtocol
  private var endPoint:EndPoints
  @Published var screenName:String = ""
  private var cancellables = Set<AnyCancellable>()
  private var pageNumber = 1
  var filterOptions:(Ratings?,SortType?) = (nil,nil)
  
  lazy private var movieService:MovieListServiceProtocol = {
    let movieService = MovieService(service: service)
    return movieService
  }()

  lazy var movieFilter = MovieFilter()
  lazy var movieSort = MovieSort()

  init(service:NetworkServiceProtocol, screenName:ScreenNames) {
    self.service = service
    self.endPoint = screenName.getEndPoints()
    self.screenName = screenName.getScreenName()
  }

  func shouldLoadMore(movie:MovieViewModel) {
    if let lastID = filteredMovies.last?.id , lastID == movie.id {
      Task {
        getMovieList()
      }
    }
    return
  }

  func getMovieList() {
    self.movieService.getMovies(cancellables: &cancellables, endPoint: endPoint, page: pageNumber) { result in
      switch result {
      case .success(let movies):
        self.movies.append(contentsOf: movies)
        self.filteredMovies.append(contentsOf: movies)
        self.pageNumber += 1
        self.filterMovie(self.filterOptions.0, nil)
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

  func filterMovie(_ rating:Ratings? = Ratings.none, _ sort:SortType? = nil) {
    if let rating = rating, rating != Ratings.none {
      filteredMovies = movieFilter.filter(movies, spec: MovieRatingSpecification(ratingEnum: rating))
      filterOptions.0 = rating 
    } else {
      filteredMovies = movies
      filterOptions.0 = Ratings.none
    }
    if let sort = sort {
      switch sort {
      case .date:
        filteredMovies = movieSort.sort({$0.releaseDate}, filteredMovies)
      case .rating:
        filteredMovies = movieSort.sort({$0.rating},filteredMovies)
      }
      filterOptions.1 = sort 
    }
  }

}
