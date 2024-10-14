//
//  HomeView.swift
//  FitnessApp
//
//  Created by Farzaad Goiporia on 2024-10-13.
//

import SwiftUI

struct HomeView: View {
    @State var calories: Double = 954.5
    @State var active: Double = 45
    @State var stand: Double = 10
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack {
                Text("Welcome")
                    .font(.largeTitle)
                    .padding()
                
                HStack(spacing: 20){
                    VStack {
                        titleData(Title: "Calories", Data: "900 KCal", textColor: .red)
                        
                        titleData(Title: "Active", Data: "52 Mins", textColor: .green)
                        
                        titleData(Title: "Stand", Data: "8 hours", textColor: .blue)
                    }
                    
                    Spacer()
                    
                    ZStack{
                        ProgressCircleView(goal: 1500, color: .red, progress: $calories)
                        ProgressCircleView(goal: 60, color: .green, progress: $active)
                            .padding(.all, 20)
                        ProgressCircleView(goal: 12, color: .blue, progress: $stand)
                            .padding(.all, 40)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}

struct titleData: View {
    var Title: String
    var Data: String
    var textColor: Color
    
    var body: some View {
        VStack{
            Text(Title)
                .font(.callout)
                .foregroundStyle(textColor)
            
            Text(Data)
                .bold()
        }
    }
}
