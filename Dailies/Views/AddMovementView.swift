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
            
            TextField("Amount", text: $stringAmount)
                .keyboardType(.decimalPad)
                .onChange(of: stringAmount) { newValue in
                    if let value = Float(newValue) {
                        floatAmount = value
                    }
                }
            
            HStack {
                Button ("income") {
                    movements.append(Movement(amount: floatAmount, isIncome: true))
                    balance += floatAmount
                    isShowingAddMovements.toggle()
                }
                Button ("expense") {
                    movements.append(Movement(amount: floatAmount, isIncome: false))
                    balance -= floatAmount
                    isShowingAddMovements.toggle()
                }
            }
        }
        .padding(20)
    }
}


