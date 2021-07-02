//
//  CircleView.swift
//  test_app
//
//  Created by Masaharu Hosomichi on 2021/07/01.
//

import SwiftUI

// File > new > File > Swift UI
// これを選ぶと、下のように View, PreviewProvider の struct 定義のテンプレートファイルが作成される
// 作成時にファイル名を指定しておくと、テンプレートに出力される構造体名も変更されるので便利

struct CircleImage: View {
  var image: Image
  
  
  var body: some View {
    image
      .clipShape(Circle())
      .overlay(Circle()
                .stroke(Color.white, lineWidth: 4))
      .shadow(radius: 7)
  }
}

struct CircleImage_Previews: PreviewProvider {
  static var previews: some View {
    CircleImage(image: Image("turtlerock"))
  }
}
