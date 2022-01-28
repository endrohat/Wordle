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
class KeyboardTile : Identifiable, Equatable, ObservableObject, Hashable {
    static func == (lhs: KeyboardTile, rhs: KeyboardTile) -> Bool {
        lhs.id == rhs.id
    }
    
    var id = UUID()
    @Published var tileState : KeyboardTileState = .normal(Color.init(red: 0.83, green: 0.83, blue: 0.83))
    var letter = ""
    
    init (letter : String) {
        self.letter = letter
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
