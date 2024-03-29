//
//  DataProcessor.swift
//  Wordle
//
//  Created by indraneel potnis on 25/01/22.
//

import Foundation
class DataProcessor {
    
    var dictionary : Set<String> = []
    var wordOfTheDay : String = ""
    init () {
        if let filepath = Bundle.main.path(forResource: "data", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                let contentsArr = contents.components(separatedBy: ",")
                
                for str in contentsArr {
                    dictionary.insert(str)
                }
                print(dictionary)
                let randomInt = Int.random(in: 0..<contentsArr.count)
                wordOfTheDay = contentsArr[randomInt]
                print(wordOfTheDay)
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        
        
    }
    
    func contains (word : String) -> Bool {
        return dictionary.contains(word)
    }
    
    
}
