//
//  FilterView.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 17/4/2024.
//

import Foundation
import SwiftUI

enum SortType:String,SegmentBindable {
  case date = "Date"
  case rating = "Rating"
  var description:String { "\(self.rawValue)"}
}

typealias FilterCompletion = (_ sortType:SortType,_ rating:Ratings)->()

struct FilterView:View {
  @Environment(\.presentationMode) var presentationMode

  @State var selectedSortType: SortType = .date
  @State var selectedRatingFilter: Ratings = .none
  let filterCompletion:FilterCompletion

  var body: some View {
    VStack(content: {
      HStack {
          Spacer()
          Button {
              presentationMode.wrappedValue.dismiss()
          } label: {
              Image(systemName: "xmark.circle")
                  .font(.system(size: 20))
                  .foregroundColor(.white)
          }.padding(.trailing, 20)
      }
      // SORT
      SegmentedView($selectedSortType, title: "Sort:")
      // RATING FILTER
      SegmentedView($selectedRatingFilter, title: "Rate:")
      Spacer()
      Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
        CustomButtonView(completion: {
          filterCompletion(selectedSortType,selectedRatingFilter)
          presentationMode.wrappedValue.dismiss()
        }, title: "Apply", backgroundColor: Color.green, cornerRadius: 12, isAnimating: .constant(false))
      }).padding()
    }).background(Color("37_37_42"))
  }
}
