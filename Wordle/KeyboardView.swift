//
//  KeyboardView.swift
//  Wordle
//
//  Created by indraneel potnis on 24/01/22.
//

import SwiftUI

struct KeyboardView: View {
    @StateObject var keyboard = Keyboard()
    @ObservedObject var tileGrid : TileGrid
    var gridItemRowLayout = [GridItem(.flexible(minimum: 50, maximum: 50))]
    @State var rowCounter = 0
    @State var letterCounter = 0
    @State var dataProcessor = DataProcessor()
    
    var body: some View {
        VStack {
            LazyHGrid(rows: gridItemRowLayout, spacing: 7) {
                ForEach(keyboard.firstRow, id: \.self) {keyboardTile in
                    WordTile(bgColor: getBgColor(keyboardTileState: keyboardTile.tileState), letter: keyboardTile.letter, foregroundColor: Color.black, font: 15)
                        .frame(width : 30, height: 30)
                        .onTapGesture {
                            if letterCounter <= 4 && rowCounter <= 4{
                                tileGrid.tiles[rowCounter][letterCounter].letter = keyboardTile.letter
                                tileGrid.tiles[rowCounter][letterCounter].tileState = .letterFilled(Color.gray)
                                letterCounter = letterCounter + 1
                            }
                            
                        }
                    
                }
            }.frame( height: 50)

            LazyHGrid(rows: gridItemRowLayout, spacing: 7) {
                ForEach(keyboard.secondRow, id: \.self) {keyboardTile in
                    WordTile(bgColor: getBgColor(keyboardTileState: keyboardTile.tileState), letter: keyboardTile.letter, foregroundColor: Color.black, font: 15)
                        .frame(width : 30, height: 30)
                        .onTapGesture {
                            if letterCounter <= 4 && rowCounter <= 4 {
                                tileGrid.tiles[rowCounter][letterCounter].letter = keyboardTile.letter
                                tileGrid.tiles[rowCounter][letterCounter].tileState = .letterFilled(Color.gray)
                                letterCounter = letterCounter + 1
                            }
                            
                        }
                    
                }
            }.frame( height: 50)
            
            LazyHGrid(rows: gridItemRowLayout, spacing: 7) {
                ForEach(keyboard.thirdRow, id: \.self) {keyboardTile in
                    WordTile(bgColor: getBgColor(keyboardTileState: keyboardTile.tileState), letter: keyboardTile.letter, foregroundColor: Color.black, font: 15)
                        .frame(width : 30, height: 30)
                        .onTapGesture {
                            if keyboardTile.letter == "⏎"  {
                                
                                if  letterCounter == 5 && rowCounter <= 4 {
                                    var word = ""
                                    for tile in tileGrid.tiles[rowCounter] {
                                        word.append(tile.letter)
                                    }
                                    word = word.lowercased()
                                    if dataProcessor.contains(word: word) {
                                        rowCounter = rowCounter + 1
                                        letterCounter = 0
                                    } else {
                                        for i in 0...4 {
                                            tileGrid.tiles[rowCounter][i].letter = ""
                                            tileGrid.tiles[rowCounter][i].tileState = .empty(Color.white)
                                        }
                                        letterCounter = 0
                                    }
                                   
                                }
                               
                            } else if keyboardTile.letter == "←" {
                                letterCounter = letterCounter - 1
                                tileGrid.tiles[rowCounter][letterCounter].letter = ""
                                tileGrid.tiles[rowCounter][letterCounter].tileState = .empty(Color.white)
            
                            } else if letterCounter <= 4 {
                                tileGrid.tiles[rowCounter][letterCounter].letter = keyboardTile.letter
                                tileGrid.tiles[rowCounter][letterCounter].tileState = .letterFilled(Color.gray)
                                letterCounter = letterCounter + 1
                            }
                            
                        }
                }
            }.frame( height: 50)
            Spacer()
        }
        
    }
    
    func getBgColor(keyboardTileState : KeyboardTileState) -> Color {
        var bgcolor : Color
        switch keyboardTileState {
        case .normal(let color):
            bgcolor = color
        case .notPresent(let color):
            bgcolor = color
        case .present(let color):
            bgcolor = color
        }
        return bgcolor
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView(tileGrid : TileGrid())
    }
}


