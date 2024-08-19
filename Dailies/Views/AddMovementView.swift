//
//  AddMovementView.swift
//  Dailies
//
//  Created by Mario Zuniga on 8/15/24.
//

import SwiftUI

struct AddMovementView: View {
    @State private var floatAmount: Float = 0.0
    @State private var stringAmount: String = ""
    
    @Binding var movements: [Movement]
    @Binding var isShowingAddMovements: Bool
    @Binding var balance: Float
    
    var body: some View {
        VStack {
            Text("Add Movement")
                .font(.headline)
            
           
            
            
            TextField("Amount", text: $stringAmount)
                .keyboardType(.decimalPad)
                .onChange(of: stringAmount) { newValue in
                    stringAmount = filterToValidFloat(newValue)
                    
                    
//                    if let value = Float(newValue) {
//                        floatAmount = value
//                    }
                }
            
            HStack {
                Button ("income") {
                    movements.append(Movement(amount: abs(floatAmount), isIncome: true))
                    balance += abs(floatAmount)
                    isShowingAddMovements.toggle()
                }
                .foregroundStyle(.green)
                Spacer()
                Button ("expense") {
                    movements.append(Movement(amount: abs(floatAmount), isIncome: false))
                    balance -= abs(floatAmount)
                    isShowingAddMovements.toggle()
                }
                .foregroundStyle(.red)
            }
            .padding()
            Spacer()
        }
        .padding(20)
    }
}


