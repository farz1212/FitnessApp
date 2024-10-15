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
    
    var mocktivity = [
        ActivtyModel(id: 0, title: "Today Steps", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .green, amount: "9,542"),
        ActivtyModel(id: 1, title: "Today Steps", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .blue, amount: "9,542"),
        ActivtyModel(id: 2, title: "Today Steps", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .yellow, amount: "9,542"),
        ActivtyModel(id: 3, title: "Today Steps", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .red, amount: "9,542"),
    ]
    
    var mockWorkout = [
        WorkoutModel(id: 0, title: "Running", color: .red,
                     duration: "130 mins", Calories: "954 Kcal" ,image: "figure.run"),
        WorkoutModel(id: 1, title: "Cycling", color: .blue,
                     duration: "50 mins", Calories: "1234 Kcal" ,image: "figure.outdoor.cycle"),
        WorkoutModel(id: 2, title: "Walking", color: .green,
                     duration: "116 mins", Calories: "352 Kcal" ,image: "figure.walk"),
        WorkoutModel(id: 3, title: "Walking", color: .green,
                     duration: "40 mins", Calories: "130 Kcal" ,image: "figure.walk"),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading) {
                    Text("Fitness Pro")
                        .font(.largeTitle)
                        .padding()
                    
                    HStack(spacing: 20){
                        VStack {
                            TitleData(Title: "Calories", Data: "900 KCal", textColor: .red)
                            
                            TitleData(Title: "Active", Data: "52 Mins", textColor: .green)
                            
                            TitleData(Title: "Stand", Data: "8 hours", textColor: .blue)
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
                        ForEach(mocktivity, id: \.id){ activity in
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
                        ForEach(mockWorkout, id: \.id){ workout in
                            WorkoutCardView(workout: workout)
                                
                        }
                    }
                }
            }
            .padding(20)
            .ignoresSafeArea(edges: .bottom)
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
