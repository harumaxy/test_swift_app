//
//  LandmarkRow.swift
//  test_app
//
//  Created by Masaharu Hosomichi on 2021/07/01.
//

import SwiftUI

// Swift DSL の if expr {} : true ならレンダリングする。false ならしない

struct LandmarkRow: View {
  var landmark: Landmark
  
  var body: some View {
    HStack {
      landmark.image.resizable().frame(width: 50, height: 50)
      Text(landmark.name)
      Spacer()
      if landmark.isFavorite { Image(systemName: "star.fill").foregroundColor(.yellow)}
    }
  }
}

// Preview 用の View では、リストアイテムは適当にグローバル配列の最初の要素とかで確認できるので楽

// Group : View Content をグループ化する。ただし、プレビューはグループの子要素を個別にレンダリングする


// view.previewLayout() スタイルは、 preview の中だけで適用されるスタイル

struct LandmarkRow_Previews: PreviewProvider {
  static var landmarks = ModelData().landmarks
  static var previews: some View {
    Group{
      LandmarkRow(landmark: landmarks[0])
      LandmarkRow(landmark: landmarks[1])
    }.previewLayout(.fixed(width: 300, height: 70))
  }
}
