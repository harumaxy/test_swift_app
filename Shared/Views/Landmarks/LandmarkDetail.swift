//
//  LandmarkDetail.swift
//  test_app
//
//  Created by Masaharu Hosomichi on 2021/07/01.
//

import SwiftUI
import Combine
// ScrollView : VStack の代わりに使える。これがないとスクロールできない

struct LandmarkDetail: View {
  @EnvironmentObject var modelData: ModelData
  var landmark: Landmark
  var landmarkIndex: Int {
    modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
  }
  var body: some View {
    ScrollView {
      MapView(coordinate: landmark.locationCoordinate).frame(height: 300)
      CircleImage(image: landmark.image)
        .offset(y: -130)
        .padding(.bottom, -130)
      VStack(alignment: .leading){
        HStack {
          Text(landmark.name)
            .padding()
            .font(.title)
          FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
        }
        HStack {
          Text(landmark.park)
          Spacer()
          Text(landmark.state)
        }.font(.subheadline).foregroundColor(.secondary)
        Divider()
        Text("About \(landmark.name)")
          .font(.subheadline)
        Text(landmark.description)
      }.padding()
      Spacer()
    }
  }
}

struct LandmarkDetail_Previews: PreviewProvider {
  static let modelData = ModelData()
  static var previews: some View {
    
    LandmarkDetail(landmark: ModelData().landmarks[0]).environmentObject(modelData)
  }
}
