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
  private let adaptability: Int
  private let child_friendly: Int
  private let dog_friendly: Int
  private let energy_level: Int
  private let health_issues: Int
  private let intelligence: Int
  private let shedding_level: Int
  private let social_needs: Int
  private let stranger_friendly: Int
  private let vocalisation: Int
  
  struct Characteristic: Hashable {
    let description: String
    let level: Int
  }
  var characteristics: [Characteristic] {
    return [
      Characteristic(description: "Adaptability", level: adaptability),
      Characteristic(description: "Child friendly", level: child_friendly),
      Characteristic(description: "Dog friendly", level: dog_friendly),
      Characteristic(description: "Energy", level: energy_level),
      Characteristic(description: "Health issues", level: health_issues),
      Characteristic(description: "Intelligence", level: intelligence),
      Characteristic(description: "Shedding", level: shedding_level),
      Characteristic(description: "Social needs", level: social_needs),
      Characteristic(description: "Stranger friendly", level: stranger_friendly),
      Characteristic(description: "Vocalisation", level: vocalisation)
    ]
  }
}

// MARK: - Conformances
extension Breed: Identifiable {}
extension Breed: Equatable {}
extension Breed: Decodable {}
