//
//  UINavigationController+BackButton.swift
//  kitty-api
//
//  Created by Jan Vítů on 02.06.2023.
//

import UIKit

extension UINavigationController {
  // Remove back button text
  open override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(
      title: "",
      style: .plain,
      target: nil,
      action: nil
    )
  }
}
