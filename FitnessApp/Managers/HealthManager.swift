//
//  HealthManager.swift
//  FitnessApp
//
//  Created by Farzaad Goiporia on 2024-10-15.
//

import SwiftUI
import HealthKit

class HealthManager {
    
    static let shared = HealthManager()
    
    let healthStore = HKHealthStore()
    
    func requestHealthKitAccess() async throws{
        
        let healthTypes: Set = [HKQuantityType(.activeEnergyBurned), HKQuantityType(.appleExerciseTime), HKCategoryType(.appleStandHour), HKQuantityType(.stepCount), HKObjectType.workoutType() ]
        
        try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
    }
    
    func fetchCaloriesBurnedToday(completion: @escaping(Result<Double, Error>) -> Void){
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate){_, results, error in
            guard let quantity = results?.sumQuantity() else{
                completion(.failure(error!))
                return
            }
            
            let calorieCount = quantity.doubleValue(for: .kilocalorie())
            completion(.success(calorieCount))
        }
        healthStore.execute(query)
    }
    
    func fetchExerciseTimeToday(completion: @escaping(Result<Double, Error>) -> Void){
        let exercise = HKQuantityType(.appleExerciseTime)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: exercise, quantitySamplePredicate: predicate){ _, results, error in
            guard let quantity = results?.sumQuantity() else{
                completion(.failure(error!))
                return
            }
            
            let exerciseTime = quantity.doubleValue(for: .minute())
            return completion(.success(exerciseTime))
        }
        healthStore.execute(query)
    }
    
    func fetchStandTimeToday(completion: @escaping(Result<Double, Error>) -> Void){
        let stand = HKCategoryType(.appleStandHour)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKSampleQuery(sampleType: stand, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil){ _, results, error in
            guard let samples = results as? [HKCategorySample] else{
                completion(.failure(error!))
                return
            }
            
            let standTime = samples.filter{ $0.value == 0 }.count
            
            completion(.success(Double(standTime)))
        }
        
        healthStore.execute(query)
    }
    
    //Activity Cards
    func fetchTodaySteps(completion: @escaping(Result<ActivityModel, Error>) -> Void){
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate){ _, results, error in
            guard let quantity = results?.sumQuantity() else{
                completion(.failure(error!))
                return
            }
            
            let steps = quantity.doubleValue(for: .count())
            let activity = ActivityModel(title: "Today Steps", subtitle: "Goal: 1000", image: "figure.walk", tintColor: .red, amount: "\(Int(steps))")
            return completion(.success(activity))
        }
        healthStore.execute(query)
    }
    
    func fetchWeeklyWorkouts(completion: @escaping(Result<[ActivityModel], Error>) -> Void){
        let workout = HKSampleType.workoutType()
        let predicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: Date())
        let query = HKSampleQuery(sampleType: workout, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil){ [weak self] _, results, error in
            guard let workouts = results as? [HKWorkout], let self = self else{
                completion(.failure(error!))
                return
            }
            var runningCount = 0
            var strengthCount = 0
            var soccerCount = 0
            var basketballCount = 0
            var stairsCount = 0
            var kickboxingCount = 0
            
            for workout in workouts{
                let duration = Int(workout.duration) / 60
                if workout.workoutActivityType == .running{
                    runningCount += duration
                }
                if workout.workoutActivityType == .traditionalStrengthTraining{
                    strengthCount += duration
                }
                if workout.workoutActivityType == .soccer{
                    soccerCount += duration
                }
                if workout.workoutActivityType == .basketball{
                    basketballCount += duration
                }
                if workout.workoutActivityType == .stairClimbing{
                    stairsCount += duration
                }
                if workout.workoutActivityType == .kickboxing{
                    kickboxingCount += duration
                }
            }
            
            return completion(.success(self.generateActivities(running: runningCount, strength: strengthCount, soccer: soccerCount, basketball: basketballCount, stairs: stairsCount, kickboxing: kickboxingCount)))
        }
        
        healthStore.execute(query)
    }
    
    func generateActivities(running: Int, strength: Int, soccer: Int, basketball: Int, stairs: Int, kickboxing: Int) -> [ActivityModel]{
        return [
            ActivityModel(title: "Running", subtitle: "Goal: 1000", image: "figure.run", tintColor: .red, amount: "\(running)"),
            ActivityModel(title: "Strength Training", subtitle: "Goal: 1000", image: "dumbbell", tintColor: .red, amount: "\(strength)"),
            ActivityModel(title: "Soccer", subtitle: "Goal: 1000", image: "figure.soccer", tintColor: .red, amount: "\(soccer)"),
            ActivityModel(title: "BasketBall", subtitle: "Goal: 1000", image: "figure.basketball", tintColor: .red, amount: "\(basketball)"),
            ActivityModel(title: "Stair Master", subtitle: "Goal: 1000", image: "figure.stairs", tintColor: .red, amount: "\(stairs)"),
            ActivityModel(title: "Kickboxing", subtitle: "Goal: 1000", image: "figure.kickboxing", tintColor: .red, amount: "\(kickboxing)")
        ]
    }
    
    func fetchWorkoutsForMonth(month: Date, completion: @escaping (Result<[WorkoutModel], Error>) -> Void) {
        let workout = HKSampleType.workoutType()
        let (startDate, endDate) = month.startAndEndOfMonth()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate)
        let sortDescriptors = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: workout, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptors]) { _, results, error in
            guard let workouts = results as? [HKWorkout] else{
                completion(.failure(error!))
                return
            }
            
            
            let workoutArray = workouts.map{WorkoutModel(id: nil, title: $0.workoutActivityType.name, color: $0.workoutActivityType.color, duration: "\(Int($0.duration) / 60)", Calories: String($0.totalEnergyBurned?.doubleValue(for: .kilocalorie()) ?? 0.0), image: $0.workoutActivityType.image)}
            
            completion(.success(workoutArray))
        }
        
        healthStore.execute(query)
    }
}

extension Date{
    static var startOfDay: Date{
        return Calendar.current.startOfDay(for: Date())
    }
    
    static var startOfWeek: Date{
        var components = Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        components.weekday = 2
        return Calendar.current.date(from: components) ?? Date()
    }
    
    func startAndEndOfMonth() -> (Date, Date) {
        let calendar = Calendar.current
        let startDateComponent = calendar.dateComponents([.year, .month], from: calendar.startOfDay(for: Date()))
        let startDate = calendar.date(from: startDateComponent) ?? Date()
        
        let endDate = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startDate) ?? Date()
        
        return (startDate, endDate)
    }
}
