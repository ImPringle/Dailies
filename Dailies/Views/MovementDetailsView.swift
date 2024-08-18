//
//  MovementDetailsView.swift
//  Dailies
//
//  Created by Mario Pringle on 16/08/24.
//

import SwiftUI

struct MovementDetailsView: View {
    var movement: Movement
    var body: some View {
        VStack {
            Text("\(movement.amount)")
            Text("Type: \(movement.isIncome ? "Income":"Expense")")
            Text("Id: \(movement.id)")
        }
        .navigationTitle("Movement Details")
    }
}
