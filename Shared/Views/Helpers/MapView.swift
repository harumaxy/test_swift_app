//
//  MapView.swift
//  test_app
//
//  Created by Masaharu Hosomichi on 2021/07/01.
//

import SwiftUI
import MapKit


// @ = attribute
// @State : この属性のついた property を更新すると、その View のbody で $prop を使っているところを自動で再renderする

struct MapView: View {
  var coordinate: CLLocationCoordinate2D
  @State private var region = MKCoordinateRegion()
  
  
  
  var body: some View {
    Map(coordinateRegion: $region)
      .onAppear {
        setRegion(coordinate)
      }
  }
  
  private func setRegion(_ coordinate: CLLocationCoordinate2D){
    region = MKCoordinateRegion(
      center: coordinate,
      span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
  }
}
