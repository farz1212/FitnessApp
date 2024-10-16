//
//  HealthManager.swift
//  FitnessApp
//
//  Created by Farzaad Goiporia on 2024-10-15.
//

import Foundation
import HealthKit

class HealthManager {
    
    static let shared = HealthManager()
    
    let healthStore = HKHealthStore()
    
    private init(){
        
        Task {
            do{
                try await requestHealthKitAccess()
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func requestHealthKitAccess() async throws{
        
        let healthTypes: Set = [HKQuantityType(.activeEnergyBurned), HKQuantityType(.appleExerciseTime), HKCategoryType(.appleStandHour)]
        
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
            
            completion(.success(2.0))
        }
        
        healthStore.execute(query)
    }
}

extension Date{
    static var startOfDay: Date{
        return Calendar.current.startOfDay(for: Date())
    }
}
