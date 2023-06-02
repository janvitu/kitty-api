//
//  APIError.swift
//  kitty-api
//
//  Created by Jan Vítů on 02.06.2023.
//

import Foundation

enum APIError: Error {
  case unaceptableStatusCode
  case decodingFailed(error: Error)
  case invalidUrlComponents
}
