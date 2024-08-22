//
//  ContentView.swift
//  Dailies
//
//  Created by Mario Zuniga on 8/14/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = NavigationPath()
    @State private var balance: Double = 0
    @State private var isShowingAddMovement: Bool = false
    @State private var isShowingSetGoal: Bool = false
    @State private var movements: [Movement] = []
    @State private var goal: Double = 1000
    @State private var confirmAnimation: Bool = false
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                VStack {
                    VStack {
                        Text("$\(String(format: "%.2f", balance))")
                            .font(.system(size: 64)).bold()
                            .padding()
                             
                        HStack{
                            Spacer()
                            Text("$\(String(format: "%.2f", goal))")
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
                                    balance: $balance, confirmAnimation: $confirmAnimation)
                                    .presentationDetents([.medium])
                            }
                            
                            Spacer()
                            
                            Button ("Set goal") {
                                isShowingSetGoal.toggle()
                            }
                            .sheet(isPresented: $isShowingSetGoal) {
                                SetGoalView(doubleGoal: $goal, isShowingSetGoal: $isShowingSetGoal)
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
                                    NavigationLink (value: movement) {
                                        HStack {
                                            Text(movement.isIncome ? "$\(String(format: "%.2f", movement.amount))" : "-$\(String(format: "%.2f", movement.amount))")
                                                .foregroundStyle(movement.isIncome ? .green : .red)
                                            Spacer()
                                            Text("\(timeAgoSinceDate(movement.date))")
                                        }
                                    }
                                }
                            } else {
                                Text("No movements yet")
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    .refreshable {
                        await movements = refreshList(&movements)
                    }
                    .navigationDestination(for: Movement.self) { movement in
                        MovementDetailsView(movement: movement)
                    }
                }
                VStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: 150, maxHeight: 150)
                            .opacity(confirmAnimation ? 0.4 : 0.0)
    //                        .scaleEffect(confirmAnimation ? 1 : 0)
                            .animation(.easeOut(duration: 0.2), value: confirmAnimation)
                        Image(systemName: "checkmark.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.green, .green.opacity(0.5))
                            .symbolEffect(.bounce, value: confirmAnimation)
                            .font(.system(size: 80))
                            .opacity(confirmAnimation ? 1.0 : 0.0)
                            .animation(.easeInOut(duration: 0.2), value: confirmAnimation)
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
