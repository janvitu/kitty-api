//
//  Font+App.swift
//  kitty-api-STRV
//
//  Created by Jan Vítů on 01.06.2023.
//

import SwiftUI

// MARK: - SwiftUI
extension Font {
  static let appTextXL: Font = .system(size: 24, weight: .bold)
  
  static let appTextLG: Font = .system(size: 20, weight: .medium)
  static let appTextBase: Font = .system(size: 16, weight: .regular)
  static let appTextSM: Font = .system(size: 14, weight: .regular)
}

// MARK: - UIKit
//extension UIFont {
//  static func clashDisplayVariableBoldSemibold(ofSize size: CGFloat) -> UIFont {
//    .init(name: "ClashDisplayVariable-Bold_Semibold", size: size)!
//  }
//}
//
//extension UIFont {
//  static let appNavigationBarLargeBase = clashDisplayVariableBoldSemibold(ofSize: 34)
//  static let appNavigationBarLarge = UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: .appNavigationBarLargeBase)
//
//  static let appNavigationBarCompactBase = clashDisplayVariableBoldSemibold(ofSize: 18)
//  static let appNavigationBarCompact = UIFontMetrics(forTextStyle: .largeTitle).scaledFont(for: .appNavigationBarCompactBase)
//
//  static let appTabBarBase = clashDisplayVariableBoldSemibold(ofSize: 11)
//  static let appTabBar = UIFontMetrics(forTextStyle: .caption1).scaledFont(for: .appTabBarBase)
//}
