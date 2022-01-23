//
//  KeyboardView.swift
//  Wordle
//
//  Created by indraneel potnis on 24/01/22.
//

import SwiftUI

struct KeyboardView: View {
    @StateObject var keyboard = Keyboard()
    private var gridItemRowLayout = [GridItem(.flexible())]
    
    var body: some View {
        LazyHGrid(rows: gridItemRowLayout, spacing: 7) {
            ForEach(keyboard.firstRow, id: \.self) {keyboardTile in
                WordTile(bgColor: getBgColor(keyboardTileState: keyboardTile.tileState), letter: keyboardTile.letter)
                    .frame(width : 30)
            }
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
        KeyboardView()
    }
}


