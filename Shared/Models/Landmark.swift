//
//  Landmark.swift
//  test_app
//
//  Created by Masaharu Hosomichi on 2021/07/01.
//

import SwiftUI
import MapKit

struct Landmark: Hashable, Codable, Identifiable {
  struct Coordinates: Hashable, Codable{
    var latitude: Double
    var longitude: Double
  }
  
  
  var id: Int
  var name: String
  var park: String
  var state: String
  var description: String
  var isFavorite: Bool
  
  private var imageName: String
  var image: Image {
    Image(imageName)
  }
  
  private var coordinates: Coordinates
  
  var locationCoordinate: CLLocationCoordinate2D{
    CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
  }
}

