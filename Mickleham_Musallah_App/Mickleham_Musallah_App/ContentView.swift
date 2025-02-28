//
//  ContentView.swift
//  Mickleham_Musallah_App
//
//  Created by Omar Fahd on 18/2/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "home"
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .offset(y: 10)
                    Text("Home")
                }
                .tag("home")
            
            Text("Duas Screen")
                .tabItem {
                    Image(systemName: "book")
                    Text("Duas")
                        .font(.headline)
                }
                .tag("duas")
            Text("Donate")
                .tabItem {
                    Image(systemName: "cart")
                    Text("Donate")
                }
                .tag("donate")
            
            Text("Settings screen")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                        .font(.largeTitle)
                }
                .tag("settings")
}


        }
    }
#Preview {
    RegistrationView()
}
