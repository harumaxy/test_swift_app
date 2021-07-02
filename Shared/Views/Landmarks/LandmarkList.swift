//
//  landmarkList.swift
//  test_app
//
//  Created by Masaharu Hosomichi on 2021/07/01.
//

import SwiftUI

// List (View)
// List { contents... } の DSL で、リストビューを作る
// closure と Array を渡して Dynamic な List にすることも可能

// List(id:) : React とか Vue と同じように、リストのアイテムは識別可能でなければならない(再レンダリングの差分などで重要)


// closure : { args in code } の形式で書く、無名関数みたいなもの。ラムダ式みたいな


// ForEach vs List
// ForEach : dynamic list な View を作成できるが、その要素は View tree 内で兄弟要素として展開される
// List : list + closure mode だと List -> [items...] の親子関係にしかならない


// Static + Dynamic List
// 一番上、一番下に何らかの固定アイテムを設置する
// List DSL mode + Static Item + ForEach で実現する


// Toggle : isOn: arg に bool state を$をつけて渡してバインドすると、on / off 時に再レンダリングする

struct LandmarkList: View {
  // @EnvironmentObject : この属性を付けたメンバー変数を保つ場合、このViewの親以上の誰かに environmentObject() modifier が適用されてれば、そこで適用されたmodelData変数を自動で取得する(つまり初期化いらず)
  // Redux の Subscriber みたいな
  @EnvironmentObject var modelData: ModelData
  @State private var showFavoriteOnly = false
  
  var filteredLandmarks: [Landmark] {
    modelData.landmarks.filter { landmark in
      (!showFavoriteOnly || landmark.isFavorite)
    }
  }
  
  var body: some View {
    //      List{
    //        LandmarkRow(landmark: landmarks[0])
    //        LandmarkRow(landmark: landmarks[1])
    //      }
    NavigationView {
      List{
        // static items
        // これ系のやつは label: で指定しても後に { view } DSL を書いても同じ結果になる
        Toggle(isOn: $showFavoriteOnly, label: {
          Text("Favorites only")
        })
        // dynamic items
        ForEach(filteredLandmarks) {landmark in
          NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
            LandmarkRow(landmark: landmark)
          }
        }
        .navigationTitle("Landmarks")
      }
      
    }
    
  }
}

// view.previewDevice() : プレビューに表示させるエミュレーター、環境を指定できる。複数プレビュー可能
// ForEach : List と同じく dynamic な list view を作る

struct LandmarkList_Previews: PreviewProvider {
  static var previews: some View {
    //      ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
    //        LandmarkList()
    //          .previewDevice(PreviewDevice(rawValue: deviceName))
    //          .previewDisplayName(deviceName)
    //      }
    LandmarkList().environmentObject(ModelData())
  }
}
