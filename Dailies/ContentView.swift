//
//  ContentView.swift
//  Dailies
//
//  Created by Mario Zuniga on 8/14/24.
//

import SwiftUI



struct ContentView: View {
    
    @State private var path = NavigationPath()
    @State private var balance: Float = 0
    @State private var isShowingAddMovement: Bool = false
    @State private var isShowingSetGoal: Bool = false
    @State private var movements: [Movement] = []
    @State private var goal: Float = 1000
    
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("\(String(format: "%.2f", balance))")
                    .font(.system(size: 64)).bold()
                    .padding()
                HStack{
                    Spacer()
                    Text("\(String(format: "%.2f", goal))")
                        .foregroundStyle(.green)
                }
                .padding(.horizontal)
                ZStack {
                    GeometryReader { geometry in
                        HStack {
                            
                        }
                        .frame(maxWidth: geometry.size.width * CGFloat((balance/goal)), maxHeight: 20)
                        .background(.green)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 20)
                .background(Color(red: 201/255, green: 201/255, blue: 201/255))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.horizontal)
                
                HStack{
                    Button ("Add") {
                        isShowingAddMovement.toggle()
                    }
                    .sheet(isPresented: $isShowingAddMovement) {
                        AddMovementView(movements: $movements, isShowingAddMovements: $isShowingAddMovement,
                            balance: $balance)
                            .presentationDetents([.medium])
                    }
                    
                    Spacer()
                    
                    Button ("Set goal") {
                        isShowingSetGoal.toggle()
                    }
                    .sheet(isPresented: $isShowingSetGoal) {
                        SetGoalView(floatGoal: $goal, isShowingSetGoal: $isShowingSetGoal)
                            .presentationDetents([.medium])
                    }
                }
                .padding()
            }
            Spacer()
            List {
                Section(header: Text("Movements")){
                    if (!movements.isEmpty) {
                        ForEach(movements.reversed(), id: \.id){ movement in
                            if (movement.isIncome) {
                                NavigationLink (value: movement) {
                                    Text("\(String(format: "%.2f", movement.amount))")
                                        .foregroundStyle(.green)
                                }
                            } else {
                                NavigationLink (value: movement) {
                                    Text("-\(String(format: "%.2f", movement.amount))")
                                        .foregroundStyle(.red)
                                }
                            }
                        }
                    } else {
                        Text("No movements yet")
                            .foregroundStyle(.gray)
                    }
                }
            }
            .navigationDestination(for: Movement.self) { movement in
                MovementDetailsView(movement: movement)
            }
        }
    }
}



#Preview {
    ContentView()
}
