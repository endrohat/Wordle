//
//  ContentView.swift
//  Wordle
//
//  Created by indraneel potnis on 23/01/22.
//

import SwiftUI
import Combine
struct ContentView: View {
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var tilegrid = TileGrid()
    @State var text : String = ""
    @State var rowCounter = 0
    var body: some View {
        let tileList : [Tile] = tilegrid.tiles.flatMap({$0})
        ScrollView {
            VStack {
                LazyVGrid(columns: gridItemLayout, spacing: 7) {
                    ForEach(tileList, id: \.self) {tile in
                        WordTile(bgColor: getBgColor(tileState: tile.tileState), letter: tile.letter)
                            .frame(height : 50)
                    }
                }
                HStack {
                    Spacer()
                    TextField("Enter", text: $text)
                        .multilineTextAlignment(.center)
                        .onReceive(Just( text) ) {
                            print($0) // You can do anything due to the change here.
                            // self.autocomplete($0) // like this
                            if $0.count == 5 {
                                var tiles : [Tile] = []
                                for char in $0 {
                                    let tile : Tile = Tile (tileState: .notPresent(Color.green), letter: "\(char)")
                                    tiles.append(tile)
                                }
                                tilegrid.tiles[rowCounter] = tiles
                                rowCounter = rowCounter + 1
                            }
                           
                        }
                    Spacer()
                }
                
            }
           
        }
    }
    
    func getBgColor(tileState : TileState) -> Color {
        var bgcolor : Color
        switch tileState {
        case .empty(let color):
            bgcolor = color
        case .notPresent(let color):
            bgcolor = color
        case .presentIncorrectPosition(let color):
            bgcolor = color
        case .presentCorrectPosition(let color):
            bgcolor = color
        }
        return bgcolor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
