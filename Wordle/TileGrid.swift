//
//  TileGrid.swift
//  Wordle
//
//  Created by indraneel potnis on 23/01/22.
//

import Foundation
import SwiftUI

class TileGrid : ObservableObject {
    @Published var tiles : [[Tile]] = []
    
    init() {
        for _ in 1...5 {
            var tileRow : [Tile] = []
            for _ in 1...5 {
                tileRow.append(Tile(tileState: .empty(Color.gray), letter: "A"))
            }
            tiles.append(tileRow)
        }
    }
}
