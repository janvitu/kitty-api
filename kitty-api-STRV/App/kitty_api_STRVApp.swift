//
//  kitty_api_STRVApp.swift
//  kitty-api-STRV
//
//  Created by Jan Vítů on 01.06.2023.
//

import SwiftUI

@main
struct kitty_api_STRVApp: App {
  init() {
    setupNavigationBarAppearance()
    setupTabBarAppearance()
    setupSegmentedControlAppearance()
  }
  
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

private extension kitty_api_STRVApp {
  func setupNavigationBarAppearance() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = .clear
    appearance.titleTextAttributes = [
      
      .foregroundColor: UIColor.appTextNavigationBar
    ]
    appearance.largeTitleTextAttributes = [
      
      .foregroundColor: UIColor.appTextNavigationBar
    ]
    
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
    UINavigationBar.appearance().compactAppearance = appearance
    
    let standardAppearance = appearance.copy()
    standardAppearance.configureWithDefaultBackground()
    standardAppearance.backgroundColor = .appBackgroundTabBar
    
    UINavigationBar.appearance().standardAppearance = standardAppearance
    
    UINavigationBar.appearance().prefersLargeTitles = true
    UINavigationBar.appearance().tintColor = .appTintNavigationBar
  }
  
  func setupTabBarAppearance() {
    let appearance = UITabBarAppearance()
    appearance.configureWithDefaultBackground()
    appearance.backgroundColor = .appBackgroundTabBar
    appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
      .foregroundColor: UIColor.appTintTabBarUnselected
    ]
    appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
      .foregroundColor: UIColor.appTintTabBarSelected
    ]
    appearance.stackedLayoutAppearance.normal.iconColor = .appTintTabBarUnselected
    appearance.stackedLayoutAppearance.selected.iconColor = .appTintTabBarSelected
    
    UITabBar.appearance().standardAppearance = appearance
    UITabBar.appearance().scrollEdgeAppearance = appearance
  }
  
  func setupSegmentedControlAppearance() {
    UISegmentedControl.appearance().setTitleTextAttributes(
      [.foregroundColor: UIColor.appTextItemTitleInverse],
      for: .normal
    )
    UISegmentedControl.appearance().setTitleTextAttributes(
      [.foregroundColor: UIColor.appTextItemTitle],
      for: .selected
    )
  }
}
