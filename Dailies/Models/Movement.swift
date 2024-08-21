//
//  Movement.swift
//  Dailies
//
//  Created by Mario Zuniga on 8/16/24.
//

import Foundation

struct Movement: Hashable {
    var id = UUID()
    var amount: Double
    var isIncome: Bool
    var date: Date
    var refresh: Bool = false
}


