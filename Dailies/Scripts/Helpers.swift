//
//  Helpers.swift
//  Dailies
//
//  Created by Mario Zuniga on 8/19/24.
//

import Foundation

func isValidInput(_ input: String) -> Bool {
    if Double(input) == 0 {return false}
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

func timeAgoSinceDate(_ date: Date, currentDate: Date = Date()) -> String {
    
    let calendar = Calendar.current
    let components = calendar.dateComponents([.second, .minute, .hour, .weekOfYear, .month, .year], from: date, to: currentDate)
    
    if let year = components.year, year >= 1 {
            return year == 1 ? "1 year ago" : "\(year) years ago"
        } else if let month = components.month, month >= 1 {
            return month == 1 ? "1 month ago" : "\(month) months ago"
        } else if let week = components.weekOfYear, week >= 1 {
            return week == 1 ? "1 week ago" : "\(week) weeks ago"
        } else if let day = components.day, day >= 1 {
            return day == 1 ? "1 day ago" : "\(day) days ago"
        } else if let hour = components.hour, hour >= 1 {
            return hour == 1 ? "1 hour ago" : "\(hour) hours ago"
        } else if let minute = components.minute, minute >= 1 {
            return minute == 1 ? "1 minute ago" : "\(minute) minutes ago"
        } else if let second = components.second, second >= 1 {
            return second == 1 ? "1 second ago" : "\(second) seconds ago"
        } else {
            return "just now"
        }
}

func refreshList (_ movements: inout [Movement]) async -> [Movement] {
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    let movs = movements
    movements = []
    return movs
}
