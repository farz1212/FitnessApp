//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Farzaad Goiporia on 2024-10-15.
//

import Foundation

class HomeViewModel: ObservableObject {
    let healthManager = HealthManager.shared
    
    @Published var calories: Double = 954.5
    @Published var active: Double = 45
    @Published var stand: Double = 10
    
    init() {
        
        healthManager.fetchCaloriesBurnedToday { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
        }
        healthManager.fetchStandTimeToday { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
        healthManager.fetchExerciseTimeToday { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
        }
    }
    
    @Published var mocktivity = [
        ActivtyModel(id: 0, title: "Today Steps", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .green, amount: "9,542"),
        ActivtyModel(id: 1, title: "Today Steps", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .blue, amount: "9,542"),
        ActivtyModel(id: 2, title: "Today Steps", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .yellow, amount: "9,542"),
        ActivtyModel(id: 3, title: "Today Steps", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .red, amount: "9,542"),
    ]
    
    @Published var mockWorkout = [
        WorkoutModel(id: 0, title: "Running", color: .red,
                     duration: "130 mins", Calories: "954 Kcal" ,image: "figure.run"),
        WorkoutModel(id: 1, title: "Cycling", color: .blue,
                     duration: "50 mins", Calories: "1234 Kcal" ,image: "figure.outdoor.cycle"),
        WorkoutModel(id: 2, title: "Walking", color: .green,
                     duration: "116 mins", Calories: "352 Kcal" ,image: "figure.walk"),
        WorkoutModel(id: 3, title: "Walking", color: .green,
                     duration: "40 mins", Calories: "130 Kcal" ,image: "figure.walk"),
    ]
}
