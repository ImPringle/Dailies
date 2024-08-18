//
//  SetGoalView.swift
//  Dailies
//
//  Created by Mario Zuniga on 8/16/24.
//

import SwiftUI

struct SetGoalView: View {
    @State private var stringGoal: String = ""
    @Binding var floatGoal: Float
    @Binding var isShowingSetGoal: Bool
    
    var body: some View {
        VStack {
            Text("Set Goal")
                .font(.headline)
            TextField("Amount", text: $stringGoal)
                .keyboardType(.decimalPad)
                .onChange(of: stringGoal) { newValue in
                    if let value = Float(newValue) {
                        floatGoal = value
                    }
                }
            
            Button ("Confirm") {
                floatGoal = Float(stringGoal)!
                isShowingSetGoal.toggle()
            }
            .padding()
            Spacer()
        }
        .padding(20)
    }
}
