//
//  KeyboardTile.swift
//  Wordle
//
//  Created by indraneel potnis on 23/01/22.
//

import Foundation
import SwiftUI
enum KeyboardTileState : Hashable {
    case normal (Color)
    case notPresent (Color)
    case present (Color)
}
struct KeyboardTile : Identifiable, Hashable, Equatable {

    var id = UUID()
    var tileState : KeyboardTileState = .normal(Color.init(red: 0.83, green: 0.83, blue: 0.83))
    var letter = ""
}
