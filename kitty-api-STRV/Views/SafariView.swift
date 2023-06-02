//
//  SafariView.swift
//  kitty-api
//
//  Created by Jan Vítů on 02.06.2023.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
  let url: URL
  
  func makeUIViewController(context: Context) -> SFSafariViewController {
    return SFSafariViewController(url: url)
  }
  
  func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    // Leave it empty
  }
}

