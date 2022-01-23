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
    var tileState : KeyboardTileState = .normal(Color.gray)
    var letter = ""
}
