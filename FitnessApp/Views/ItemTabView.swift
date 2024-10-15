//
//  TabView.swift
//  FitnessApp
//
//  Created by Farzaad Goiporia on 2024-10-13.
//

import SwiftUI

struct ItemTabView: View {
    @State var selectedTab = "Home"
    
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView()
                .tag("Home")
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            
            DataView()
                .tag("Historic")
                .tabItem{
                    Label("Data", systemImage: "chart.line.uptrend.xyaxis")
                }
            
        }
        .tint(.green)
        
    }
}

#Preview {
    ItemTabView()
}
