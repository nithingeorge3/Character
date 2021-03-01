//
//  Constants.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import UIKit

//enum with implicit assignment
enum Appearance: Int {
    case season1 = 1, season2, season3, season4, season5, season6, season7, season8, season9, season10
    func getID() -> Int {
        return self.rawValue
  }
}

let sb: UIStoryboard?       = UIStoryboard(name: "Main", bundle: nil)
let kFetchCharacterListURL  = "/characters"
