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

  var uiKitTabView:UIKitTabView!

  init() {
    setUIKitTabBar()
    setTabBarItems()
  }

  private func setUIKitTabBar() {
    UITabBar.appearance().barTintColor = UIColor(named : "40_40_40")
    UITabBar.appearance().tintColor = UIColor.white
    UITabBar.appearance().backgroundColor = UIColor(named : "60_60_60")

    coloredNavAppearance.configureWithOpaqueBackground()
    coloredNavAppearance.backgroundColor = UIColor(named : "37_37_42")
    coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

    UINavigationBar.appearance().standardAppearance = coloredNavAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
  }

  private mutating func setTabBarItems() {
    let homeTabBarItem = UIKitTabView.Tab(view: HomeView(service:service), tabBarItem: UITabBarItem(title: "", image: UIImage(named: "barHome"), selectedImage: UIImage(named: "barHomeSelect")))
    homeTabBarItem.barItem.accessibilityIdentifier = "HomeTabbarButton"
    let searchTabbarItem = UIKitTabView.Tab(
        view: SearchView(service: service),
        tabBarItem: UITabBarItem(title: "", image: UIImage(named: "barSearch"), selectedImage: UIImage(named: "barSearchSelect")))
    searchTabbarItem.barItem.accessibilityIdentifier = "SearchTabbarButton"
    self.uiKitTabView = UIKitTabView([homeTabBarItem,searchTabbarItem])
  }

  var body: some View {
    ZStack {
      uiKitTabView
    }
  }
}

#Preview {
    ContentView()
}
