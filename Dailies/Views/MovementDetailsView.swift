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
            VStack {
                Text(movement.isIncome ? "$\(String(format: "%.2f",movement.amount))" : "-$\(String(format: "%.2f",movement.amount))")
                    .font(.system(size: 64)).bold()
                    .foregroundStyle(movement.isIncome ? .green : .red)
                    .padding()
                HStack {
                    Text("Type:")
                    Spacer()
                    Text("\(movement.isIncome ? "Income":"Expense")")
                }
                .padding()
                HStack {
                    Text("Id:")
                    Spacer()
                    Text("\(movement.id)")
                }
                .padding()
                HStack {
                    Text("Date:")
                    Spacer()
                    Text("\(movement.date, formatter: dateFormatter)")
                }
                .padding()
            }
            Spacer()
        }
        .accentColor(.white)
        .navigationTitle("Movement Details")
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return formatter
    }
}
