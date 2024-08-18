//
//  Movement.swift
//  Dailies
//
//  Created by Mario Zuniga on 8/16/24.
//

import Foundation

struct Movement: Hashable {
    var id = UUID()
    var amount: Float
    var isIncome: Bool
}
