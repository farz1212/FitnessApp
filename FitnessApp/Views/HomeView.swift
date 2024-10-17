//
//  HomeView.swift
//  FitnessApp
//
//  Created by Farzaad Goiporia on 2024-10-13.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading) {
                    Text("Fitness Pro")
                        .font(.largeTitle)
                        .padding()
                    
                    HStack(spacing: 20){
                        VStack {
                            TitleData(Title: "Calories", Data: "\(viewModel.calories)", textColor: .red)
                            
                            TitleData(Title: "Active", Data: "\(viewModel.exercise)", textColor: .green)
                            
                            TitleData(Title: "Stand", Data: "\(viewModel.stand)", textColor: .blue)
                        }
                        
                        Spacer()
                        
                        ZStack{
                            ProgressCircleView(goal: 1500, color: .red, progress: viewModel.calories)
                            ProgressCircleView(goal: 60, color: .green, progress: viewModel.exercise)
                                .padding(.all, 20)
                            ProgressCircleView(goal: 12, color: .blue, progress: viewModel.stand)
                                .padding(.all, 40)
                        }
                    }
                    
                    HStack(spacing: 20){
                        Text("Fitness Activity")
                            .font(.title2)
                        Spacer()
                        Button {
                            print("")
                        } label: {
                            ButtonLabel()
                        }
                    }
                    
                    LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 2)){
                        ForEach(viewModel.activities, id: \.title){ activity in
                            ActivityCardView(activity: activity)
                        }
                    }
                    
                    HStack{
                        Text("Recent Workouts")
                        
                        Spacer()
                        
                        NavigationLink(destination: EmptyView()){
                            ButtonLabel()
                        }
                    }
                    
                    LazyVStack{
                        ForEach(viewModel.workouts, id: \.title){ workout in
                            WorkoutCardView(workout: workout)
                                
                        }
                    }
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    HomeView()
}

struct TitleData: View {
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

struct ButtonLabel: View {
    var body: some View {
        Text("Show more")
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .cornerRadius(15)
            .padding(.top)
    }
}
