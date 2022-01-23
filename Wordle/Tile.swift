//
//  Tile.swift
//  Wordle
//
//  Created by indraneel potnis on 23/01/22.
//

import Foundation
import SwiftUI
enum TileState : Hashable {
    case empty (Color)
    case notPresent (Color)
    case presentIncorrectPosition (Color)
    case presentCorrectPosition (Color)
}
struct Tile : Identifiable, Hashable, Equatable {

    var id = UUID()
    var tileState : TileState = .empty(Color.gray)
    var letter = ""
}
