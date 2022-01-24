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
        firstRow.append(KeyboardTile( letter: "Q"))
        firstRow.append(KeyboardTile( letter: "W"))
        firstRow.append(KeyboardTile( letter: "E"))
        firstRow.append(KeyboardTile( letter: "R"))
        firstRow.append(KeyboardTile( letter: "T"))
        firstRow.append(KeyboardTile( letter: "Y"))
        firstRow.append(KeyboardTile( letter: "U"))
        firstRow.append(KeyboardTile( letter: "I"))
        firstRow.append(KeyboardTile( letter: "O"))
        firstRow.append(KeyboardTile( letter: "P"))
        
        secondRow.append(KeyboardTile( letter: "A"))
        secondRow.append(KeyboardTile(letter: "S"))
        secondRow.append(KeyboardTile( letter: "D"))
        secondRow.append(KeyboardTile( letter: "F"))
        secondRow.append(KeyboardTile( letter: "G"))
        secondRow.append(KeyboardTile (letter: "H"))
        secondRow.append(KeyboardTile( letter: "J"))
        secondRow.append(KeyboardTile( letter: "K"))
        secondRow.append(KeyboardTile( letter: "L"))
        
        thirdRow.append(KeyboardTile( letter: "⏎"))
        thirdRow.append(KeyboardTile( letter: "X"))
        thirdRow.append(KeyboardTile( letter: "C"))
        thirdRow.append(KeyboardTile(letter: "V"))
        thirdRow.append(KeyboardTile( letter: "B"))
        thirdRow.append(KeyboardTile( letter: "N"))
        thirdRow.append(KeyboardTile( letter: "M"))
        thirdRow.append(KeyboardTile( letter: "←"))
    }
}
