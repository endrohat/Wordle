//
//  Keyboard.swift
//  Wordle
//
//  Created by indraneel potnis on 23/01/22.
//

import Foundation
import SwiftUI
class Keyboard : ObservableObject {
    
    var firstRow: [KeyboardTile] = []
    var secondRow: [KeyboardTile] = []
    var thirdRow: [KeyboardTile] = []
    
    init() {
        firstRow.append(KeyboardTile(tileState: .normal(Color.gray), letter: "Q"))
        firstRow.append(KeyboardTile(tileState: .normal(Color.gray), letter: "W"))
        firstRow.append(KeyboardTile(tileState: .normal(Color.gray), letter: "E"))
        firstRow.append(KeyboardTile(tileState: .normal(Color.gray), letter: "R"))
        firstRow.append(KeyboardTile(tileState: .normal(Color.gray), letter: "T"))
        firstRow.append(KeyboardTile(tileState: .normal(Color.gray), letter: "Y"))
        firstRow.append(KeyboardTile(tileState: .normal(Color.gray), letter: "U"))
        firstRow.append(KeyboardTile(tileState: .normal(Color.gray), letter: "I"))
        firstRow.append(KeyboardTile(tileState: .normal(Color.gray), letter: "O"))
        firstRow.append(KeyboardTile(tileState: .normal(Color.gray), letter: "P"))
    }
}
