//
//  Helpers.swift
//  Dailies
//
//  Created by Mario Zuniga on 8/19/24.
//

import Foundation

func filterToValidFloat(_ input: String) -> String {
    let pattern: String = "^[0-9]+(.[0-9]+)?$"
    do {
        let regex = try NSRegularExpression(pattern: pattern)
        let range = NSRange (location: 0, length: input.utf16.count)
        let filteredText = regex.stringByReplacingMatches(in: input, options: [], range: range, withTemplate: "")
        return filteredText
    } catch {
        
    }
    
    return ""
}
