//
//  Specie.swift
//  kitty-api-STRV
//
//  Created by Jan Vítů on 01.06.2023.
//

import Foundation

struct Breed {
  struct Image: Equatable, Decodable {
    let id: String
    let width: Int
    let height: Int
    let url: String
  }
  let id: String
  let name: String
  let description: String
  let origin: String
  let life_span: String
  let wikipedia_url: String?
  let image: Image?
  // characteristics
  let adaptability: Int
  let child_friendly: Int
  let dog_friendly: Int
  let energy_level: Int
  let health_issues: Int
  let intelligence: Int
  let shedding_level: Int
  let social_needs: Int
  let stranger_friendly: Int
  let vocalisation: Int
}

// MARK: - Conformances
extension Breed: Identifiable {}
extension Breed: Equatable {}
extension Breed: Decodable {}
