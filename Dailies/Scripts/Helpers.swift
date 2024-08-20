//
//  Helpers.swift
//  Dailies
//
//  Created by Mario Zuniga on 8/19/24.
//

import Foundation

func isValidInput(_ input: String) -> Bool {
    let pattern: String = "^[0-9]+(\\.)?([0-9]+)?$"
    do {
        let regex = try NSRegularExpression(pattern: pattern)
        let range = NSRange (location: 0, length: input.utf16.count)
        let match = regex.firstMatch(in: input, options: [], range: range)

        return match != nil
    } catch {
        return false
    }
}
