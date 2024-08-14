//
//  ContentView.swift
//  Dailies
//
//  Created by Mario Zuniga on 8/14/24.
//

import SwiftUI



struct ContentView: View {
    var platforms: [Platform] =
        [.init(name: "PC", imageName: "pc", color: .pink),
         .init(name: "Playstation", imageName:"playstation.logo", color: .blue),
         .init(name: "Xbox", imageName:"xbox.logo", color: .green),
         .init(name: "Mobile", imageName:"iphone", color: .purple),]

    var games: [Game] = [.init(name: "Rocket League", rating: "10/10"),
                         .init(name: "Call of Duty: Warzone", rating: "9/10"),
                         .init(name: "Valorant", rating: "9.5/10"),
                         .init(name: "Free Fire", rating: "3/10")]
    
    @State private var path: [Game] = []
    
    var body: some View {
        NavigationStack (path: $path) {
            List {
                Section("Platforms") {
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform){
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundStyle(platform.color)
                        }
                    }
                }
                Section("Games") {
//                    ForEach(games, id: \.name) {game in
//                        NavigationLink(value: game) {
//                            Text(game.name)
//                        }
//                    }
                    Button("Add Games") {
                        path = games
                    }
                }
            }
            .navigationTitle("Gaming")
            .navigationDestination(for: Platform.self) { platform in
                ZStack {
                    platform.color.ignoresSafeArea()
                    Label(platform.name, systemImage: platform.imageName)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                }
            }
            .navigationDestination(for: Game.self) {game in
                VStack {
                    Text("\(game.name) -> rating: \(game.rating)" )
                        .font(.largeTitle.bold())
                    Button("Go back to home") {
                        path = []
                    }
                }
                
            }
        }
        
        
        
    }
}

struct Platform: Hashable {
    let name: String
    let imageName: String
    let color: Color
}

struct Game: Hashable {
    let name: String
    let rating: String
}

#Preview {
    ContentView()
}
