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
    
   
    
    @StateObject var tilegrid = TileGrid()
    @StateObject var keyboard = Keyboard()
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
 
                KeyboardView()
                    .onTapGesture {
                      print("tap")
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
