//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Farzaad Goiporia on 2024-10-15.
//

import Foundation

class HomeViewModel: ObservableObject {
    let healthManager = HealthManager.shared
    
    @Published var calories: Int = 0
    @Published var exercise: Int = 0
    @Published var stand: Int = 0
    @Published var activities: [ActivityModel] = []
    @Published var workouts: [WorkoutModel] = []
    
    init() {
        Task{
            do {
                try await healthManager.requestHealthKitAccess()
                fetchTodayBurnedCalories()
                fetchTodayExerciseTime()
                fetchTodayStandTime()
                fetchActivities()
                fetchWorkouts()
            } catch {
                print("Error requesting health kit access: \(error)")
            }
        }
    }
    
    @Published var mocktivity = [
        ActivityModel(title: "Steps", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .green, amount: "9,542"),
        ActivityModel(title: "Steps 1", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .blue, amount: "9,542"),
        ActivityModel(title: "Steps 2", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .yellow, amount: "9,542"),
        ActivityModel(title: "Steps 3", subtitle: "Goal 15,000", image: "figure.walk", tintColor: .red, amount: "9,542"),
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
    
    func fetchTodayBurnedCalories(){
        healthManager.fetchCaloriesBurnedToday { result in
            switch result {
            case .success(let calories):
                DispatchQueue.main.async {
                    self.calories = Int(calories)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchTodayExerciseTime(){
        healthManager.fetchExerciseTimeToday { result in
            switch result {
            case .success(let hours):
                DispatchQueue.main.async {
                    self.exercise = Int(hours)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
        
    }
    
    func fetchTodayStandTime(){
        healthManager.fetchStandTimeToday { result in
            switch result {
            case .success(let hours):
                DispatchQueue.main.async {
                    self.stand = Int(hours)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchActivities(){
        healthManager.fetchWeeklyWorkouts { result in
            switch result {
            case .success(let workoutArray):
                DispatchQueue.main.async {
                    self.activities = workoutArray
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchWorkouts(){
        healthManager.fetchWorkoutsForMonth(month: Date()) { result in
            switch result {
            case .success(let workoutArray):
                DispatchQueue.main.async {
                    self.workouts = workoutArray
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
