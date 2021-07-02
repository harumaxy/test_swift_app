//
//  FavoriteButton.swift
//  test_app
//
//  Created by Masaharu Hosomichi on 2021/07/02.
//

import SwiftUI

struct FavoriteButton: View {
  // @Binding attribute をつけると、Initializer関数の引数が Generic type の Binding<T>変数に変換される
  // ここでは Binding<Bool>
  @Binding var isSet: Bool
  var body: some View {
    Button(action: {
      isSet.toggle()
    }){
      Image(systemName: isSet ? "star.fill" : "star")
        .foregroundColor(isSet ? Color.yellow : Color.gray)
    }
  }
}

struct FavoriteButton_Previews: PreviewProvider {
  static var previews: some View {
    // Binding.constant(value) : static method. 定数値をバインドする
    FavoriteButton(isSet: .constant(true))
  }
}
