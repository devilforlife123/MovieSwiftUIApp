//
//  HorizontalMovieSliderView.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation
import SwiftUI

struct HorizontalMovieSliderView:View {
  @Binding var movies:[MovieViewModel]
  let sliderType:ScreenNames 
  
  var body: some View {
      VStack(alignment: .leading) {
        NavigationLink {
        } label: {
          HomeHeaderView(title: sliderType.getScreenName()).padding([.leading, .trailing], 20)
        }
          ScrollView(.horizontal, showsIndicators: false) {
              HStack (spacing: 15){
                  ForEach(movies, id: \.id) { item in
                      GeometryReader { proxy in
                        let scale = getScale(proxy: proxy)
                        NavigationLink {
                          MovieDetail(service: NetworkManager().service, movieId: item.id)
                        } label: {
                          GridMovieCardView(movie: item)
                        }.scaleEffect(.init(width: scale, height: scale))
                          .animation(.easeOut, value: 0.5)
                      }.frame(width: 130, height: 200)
                          .padding(.horizontal, 8)
                          .padding(.top, 26)

                  }
              }.padding([.leading, .trailing], 20)
          }.padding([.bottom], 20)
          Rectangle()
              .frame(height: 1, alignment: .center)
              .foregroundColor(.gray)
              .padding([.leading, .trailing], 120)
      }.background(Color("37_37_42"))
  }

  func getScale(proxy: GeometryProxy) -> CGFloat {
    let midPoint: CGFloat = 130

    let viewFrame = proxy.frame(in: CoordinateSpace.global)

    var scale: CGFloat = 1.0
    let deltaXAnimationThreshold: CGFloat = 130

    let diffFromCenter = abs(midPoint - viewFrame.origin.x - deltaXAnimationThreshold / 2)
    if diffFromCenter < deltaXAnimationThreshold {
        scale = 1 + (deltaXAnimationThreshold - diffFromCenter) / 500
    }
    return scale
  }
}
