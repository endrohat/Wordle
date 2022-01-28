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
    var dataProcessor : DataProcessor
    @State var isGameOver = false
    
    var body: some View {
        VStack {
            LazyHGrid(rows: gridItemRowLayout, spacing: 7) {
                ForEach(keyboard.firstRow, id: \.self) {keyboardTile in
                    WordTile(bgColor: getBgColor(keyboardTileState: keyboardTile.tileState), letter: keyboardTile.letter, foregroundColor: Color.black, font: 15)
                        .frame(width : 30, height: 30)
                        .onTapGesture {
                            handleRowClick(keyboardTile: keyboardTile)
                        }
                    
                }
            }.frame( height: 50)

            LazyHGrid(rows: gridItemRowLayout, spacing: 7) {
                ForEach(keyboard.secondRow, id: \.self) {keyboardTile in
                    WordTile(bgColor: getBgColor(keyboardTileState: keyboardTile.tileState), letter: keyboardTile.letter, foregroundColor: Color.black, font: 15)
                        .frame(width : 30, height: 30)
                        .onTapGesture {
                            handleRowClick(keyboardTile: keyboardTile)
                        }
                    
                }
            }.frame( height: 50)
            
            LazyHGrid(rows: gridItemRowLayout, spacing: 7) {
                ForEach(keyboard.thirdRow, id: \.self) {keyboardTile in
                    WordTile(bgColor: getBgColor(keyboardTileState: keyboardTile.tileState), letter: keyboardTile.letter, foregroundColor: Color.black, font: 15)
                        .frame(width : 30, height: 30)
                        .onTapGesture {
                            handleLastRowClick(keyboardTile: keyboardTile)
                        }
                }
            }.frame( height: 50)
            Spacer()
        }
        
    }
    
    func handleRowClick(keyboardTile : KeyboardTile) {
        if isGameOver {
            return
        }
        if letterCounter <= 4 && rowCounter <= 4{
            tileGrid.tiles[rowCounter][letterCounter].letter = keyboardTile.letter
            tileGrid.tiles[rowCounter][letterCounter].tileState = .letterFilled(Color.gray)
            letterCounter = letterCounter + 1
        }
    }
    
    func handleLastRowClick(keyboardTile : KeyboardTile) {
        if isGameOver {
            return
        }
        if keyboardTile.letter == "⏎"  {
            
            if  letterCounter == 5 && rowCounter <= 4 {
                var word = ""
                for tile in tileGrid.tiles[rowCounter] {
                    word.append(tile.letter)
                }
                word = word.lowercased()
                if dataProcessor.contains(word: word) {
                    if dataProcessor.wordOfTheDay == word {
                        colorAllGreen()
                    } else {
                        var remainingIndices : [Int] = []
                        for i in 0...4 {
                            let typedWordIndex = word.index(word.startIndex, offsetBy: i)
                            let wordOfTheDayIndex = dataProcessor.wordOfTheDay.index(dataProcessor.wordOfTheDay.startIndex, offsetBy: i)
                            
                            if word[typedWordIndex] == dataProcessor.wordOfTheDay[wordOfTheDayIndex] {
                                tileGrid.tiles[rowCounter][i].tileState = .presentCorrectPosition(Color.green)
                                highlightKey(letter: word[typedWordIndex], color: Color.green)
                            } else {
                                remainingIndices.append(i)
                            }
                        }
                        
                        for i in remainingIndices {
                            let typedWordIndex = word.index(word.startIndex, offsetBy: i)
                            let typedCharacter = word[typedWordIndex]
                            
                            if dataProcessor.wordOfTheDay.contains(typedCharacter) {
                                tileGrid.tiles[rowCounter][i].tileState = .presentIncorrectPosition(Color.orange)
                            }
                        }
                    }
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
            if letterCounter > 0 {
                letterCounter = letterCounter - 1
                tileGrid.tiles[rowCounter][letterCounter].letter = ""
                tileGrid.tiles[rowCounter][letterCounter].tileState = .empty(Color.white)
            }

        } else if letterCounter <= 4 {
            tileGrid.tiles[rowCounter][letterCounter].letter = keyboardTile.letter
            tileGrid.tiles[rowCounter][letterCounter].tileState = .letterFilled(Color.gray)
            letterCounter = letterCounter + 1
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
    
    func highlightKey(letter : Character, color : Color) {
        for var tile in keyboard.firstRow {
            if tile.letter == String(letter).uppercased() {
                tile.tileState = .present(color)
                return
            }
        }
        
        for var tile in keyboard.secondRow {
            if tile.letter == String(letter).uppercased() {
                tile.tileState = .present(color)
                return
            }
        }
        
        for var tile in keyboard.thirdRow {
            if tile.letter == String(letter).uppercased() {
                tile.tileState = .present(color)
                return
            }
        }
    }
    
    func colorAllGreen() {
        for i in 0...4 {
    
            tileGrid.tiles[rowCounter][i].tileState = .presentCorrectPosition(Color.green)
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView(tileGrid : TileGrid(), dataProcessor: DataProcessor())
    }
}


