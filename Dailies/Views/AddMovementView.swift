//
//  AddMovementView.swift
//  Dailies
//
//  Created by Mario Zuniga on 8/15/24.
//

import SwiftUI

struct AddMovementView: View {
    @State private var doubleAmount: Double = 0.0
    @State private var stringAmount: String = ""
    @State private var isValid: Bool = false
    @FocusState private var isFocused: Bool
    
    @Binding var movements: [Movement]
    @Binding var isShowingAddMovements: Bool
    @Binding var balance: Double
    
    var body: some View {
        VStack {
            Text("Add Movement")
                .font(.headline)
            
            TextField("Amount", text: $stringAmount)
                .keyboardType(.decimalPad)
                .onChange(of: stringAmount) {
                    
                    isValid = isValidInput(stringAmount)
                    
                    if (isValid) {
                        doubleAmount = Double(stringAmount)!
                    }
                }
                .focused($isFocused)
                .onAppear {
                    isFocused = true
                }
                
            
            HStack {
                if isValid {
                    Button ("income") {
                        movements.append(Movement(amount: abs(doubleAmount), isIncome: true, date: Date()))
                        balance += abs(doubleAmount)
                        isFocused = false
                        isShowingAddMovements.toggle()
                    }
                    .foregroundStyle(.green)
                    Spacer()
                    Button ("expense") {
                        movements.append(Movement(amount: abs(doubleAmount), isIncome: false, date: Date()))
                        balance -= abs(doubleAmount)
                        isFocused = false
                        isShowingAddMovements.toggle()
                    }
                    .foregroundStyle(.red)
                } else {
                    Text("income")
                        .foregroundStyle(.gray)
                    Spacer()
                    Text("expense")
                        .foregroundStyle(.gray)
                }
                
            }
            .padding()
            Spacer()
        }
        .padding(20)
    }
}


