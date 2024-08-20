//
//  SetGoalView.swift
//  Dailies
//
//  Created by Mario Zuniga on 8/16/24.
//

import SwiftUI

struct SetGoalView: View {
    @State private var stringGoal: String = ""
    @State private var isValid: Bool = false
    @FocusState private var isFocused: Bool

    @Binding var doubleGoal: Double
    @Binding var isShowingSetGoal: Bool
    
    var body: some View {
        VStack {
            Text("Set Goal")
                .font(.headline)
            TextField("Amount", text: $stringGoal)
                .keyboardType(.decimalPad)
                .onChange(of: stringGoal) {
                    isValid = isValidInput(stringGoal)
                }
                .focused($isFocused)
                .onAppear {
                    isFocused = true
                }
            if isValid {
                Button ("Confirm") {
                    doubleGoal = Double(stringGoal)!
                    isShowingSetGoal.toggle()
                }
                .padding()
            } else {
                Text("Confirm")
                    .padding()
                    .foregroundStyle(.gray)
            }
            Spacer()
        }
        .padding(20)
    }
}
