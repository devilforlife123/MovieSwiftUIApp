//
//  UIKitTabView.swift
//  MovieSwiftUIApp
//
//  Created by suraj poudel on 16/4/2024.
//

import Foundation
import SwiftUI

struct UIKitTabView:View {
  var viewControllers:[UIHostingController<AnyView>]

  init(_ tabs:[Tab]) {
    self.viewControllers = tabs.map({ let host = UIHostingController(rootView: $0.view)
      host.tabBarItem = $0.barItem
      return host})
  }
  struct Tab {
    var view:AnyView
    var barItem:UITabBarItem

    init<V:View>(view:V,tabBarItem:UITabBarItem) {
      self.view = AnyView(view)
      self.barItem = tabBarItem
    }
  }
  var body: some View {
    TabBarController(controllers: viewControllers).edgesIgnoringSafeArea(.all)
  }
}
struct TabBarController:UIViewControllerRepresentable {
  var controllers:[UIViewController]

  func makeUIViewController(context: Context) -> some UIViewController {
    let tabBarController = UITabBarController()
    tabBarController.viewControllers = controllers
    return tabBarController
  }

  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
  }
}
