//
//  ContentView.swift
//  kitty-api
//
//  Created by Jan Vítů on 01.06.2023.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      BreedsListView()
        .preferredColorScheme(.none)
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
