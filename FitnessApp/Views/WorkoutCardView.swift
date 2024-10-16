//
//  WorkoutCardView.swift
//  FitnessApp
//
//  Created by Farzaad Goiporia on 2024-10-14.
//

import SwiftUI

struct WorkoutCardView: View {
    @State var workout: WorkoutModel
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray4)
            
            HStack {
                ZStack {
                    Image(systemName: workout.image)
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    ProgressCircleView(
                        goal: 100,
                        color: workout.color,
                        width: 5,
                        progress: 75
                    )
                }
                
                Text(workout.title)
                    .font(.title)
                
                Spacer()
                
                VStack(spacing: 15){
                    Text(workout.duration)
                    Text(workout.Calories)
                }
                .font(.headline)
                
            }
            .padding()
        }
        .frame(width: .none , height: 100)
        .cornerRadius(15)
    }
}

#Preview {
    WorkoutCardView(
        workout: WorkoutModel(id: 0, title: "Running", color: .red, duration: "43 Mins", Calories: "734 Kcal", image: "figure.run"
        )
    )
}
