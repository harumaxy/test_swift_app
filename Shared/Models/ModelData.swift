//
//  ModelData.swift
//  test_app
//
//  Created by Masaharu Hosomichi on 2021/07/01.
//

import Foundation
import Combine

// gurad expr else { //code }
// guard: expr が nil とか false のときに else が実行される。 else節の中で return, break, throw error などを使わないとコンパイルエラー

// do {//code} catch {} : swift の try catch 文
// try (func()) : エラーを　throw する可能性のある関数は、 try をつけないと実行できない


// Bundle.main.url(forResource: ...) でロードするファイルは、 Target MemberShip を設定しとかないと開けない
// ファイル名だけでOK. path はいらない
//var landmarks: [Landmark] = load("landmarkData.json")


// ObservableObject protocol
// このプロトコルを実装したオブジェクトのデータは、カスタムストアとして機能し
// このオブジェクトに対する変更は監視され、view を再レンダリングする
// 要するに、PubSub の Pub
final class ModelData: ObservableObject {
  // グローバル変数にしていたものをこのクラスのプロパティに移した
  
  // @Published attribute をつけているメンバーだけが更新をサブスクできる
  @Published var landmarks: [Landmark] = load("landmarkData.json")
}


func load<T: Decodable>(_ filename: String) -> T {
  let data: Data
  guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
  else{
    fatalError("Couldn't find \(filename) in main bundle.")
  }
  
  do {
    data = try Data(contentsOf: file)
  } catch {
    fatalError("Couldn't load \(filename) rom main bundle:\n\(error)")
  }
  
  do {
    let decorder = JSONDecoder()
    return try decorder.decode(T.self, from: data)
  } catch {
    fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
  }
}


