//
//  ContentView.swift
//  Shared
//
//  Created by Masaharu Hosomichi on 2021/06/30.
//

import SwiftUI

// constructor = initializer
// View {} コンストラクタの中は、セミコロン区切り無しで複数の View 値を書ける。それらはShiviling Item になる(兄弟)
// View constructor を Cmd + click -> Embed in VStack / HStack で簡単に囲める (縦横レイアウト)


struct ContentView: View {
    var body: some View {
      LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        ContentView()
          .previewLayout(.sizeThatFits)
          .environmentObject(ModelData())
      }
    }
}
