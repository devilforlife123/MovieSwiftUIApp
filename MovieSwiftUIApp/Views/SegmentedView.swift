//
//  SegmentedView.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 17/4/2024.
//

import Foundation
import SwiftUI

struct SegmentedView<T>:View where T:SegmentBindable{

  let title:String
  @Binding var value:T
  let segments:Array<T>

  init(_ value:Binding<T> , title:String) {
    self._value = value
    self.title = title
    self.segments = T.allCases as! Array<T>
  }
  
  var body: some View {
    VStack {
        HStack(spacing: 0) {
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
          Picker(selection:$value,label:Text(""),content: {
            ForEach(self.segments, id: \.self) { text in
              Text(text.description)
            }
          })
            .background(Color.clear)
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            .padding(.trailing)
            Spacer()
        }
        Divider()
            .background(Color.gray)
            .padding(.horizontal)
    }.background(Color("37_37_42"))
  }
}
