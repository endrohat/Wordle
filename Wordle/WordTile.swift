//
//  WordTile.swift
//  Wordle
//
//  Created by indraneel potnis on 23/01/22.
//

import SwiftUI

struct WordTile: View {
    var bgColor : Color
    var letter : String
    var foregroundColor = Color.white
    var font : CGFloat = 30
    var body: some View {
        ZStack {
            Rectangle()
                .fill(bgColor)
                .border(.gray, width: 3)
            Text(letter)
                .font(.system(size: font))
                .foregroundColor(foregroundColor)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
    }
}

struct WordTile_Previews: PreviewProvider {
    static var previews: some View {
        WordTile(bgColor : Color.red, letter: "M")
    }
}
