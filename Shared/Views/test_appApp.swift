//
//  test_appApp.swift
//  Shared
//
//  Created by Masaharu Hosomichi on 2021/06/30.
//

import SwiftUI

@main
struct test_appApp: App {
    // @StateObject : appのライフタイムで一回だけ初期化する。
    // @State vs @ StateObject : @State は view が 取り除かれて、またツリーに入った時に再度初期化される
    @StateObject private var modelData = ModelData()
  
    var body: some Scene {
        WindowGroup {
          ContentView().environmentObject(modelData)
        }
    }
}
