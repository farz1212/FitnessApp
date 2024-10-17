//
//  WorkoutExtension.swift
//  FitnessApp
//
//  Created by Farzaad Goiporia on 2024-10-17.
//

import HealthKit
import SwiftUICore

extension HKWorkoutActivityType {

    var name: String {
        switch self {
        case .americanFootball:             return "American Football"
        case .archery:                      return "Archery"
        case .australianFootball:           return "Australian Football"
        case .badminton:                    return "Badminton"
        case .baseball:                     return "Baseball"
        case .basketball:                   return "Basketball"
        case .bowling:                      return "Bowling"
        case .boxing:                       return "Boxing"
        case .climbing:                     return "Climbing"
        case .crossTraining:                return "Cross Training"
        case .curling:                      return "Curling"
        case .cycling:                      return "Cycling"
        case .dance:                        return "Dance"
        case .danceInspiredTraining:        return "Dance Inspired Training"
        case .elliptical:                   return "Elliptical"
        case .equestrianSports:             return "Equestrian Sports"
        case .fencing:                      return "Fencing"
        case .fishing:                      return "Fishing"
        case .functionalStrengthTraining:   return "Functional Strength Training"
        case .golf:                         return "Golf"
        case .gymnastics:                   return "Gymnastics"
        case .handball:                     return "Handball"
        case .hiking:                       return "Hiking"
        case .hockey:                       return "Hockey"
        case .hunting:                      return "Hunting"
        case .lacrosse:                     return "Lacrosse"
        case .martialArts:                  return "Martial Arts"
        case .mindAndBody:                  return "Mind and Body"
        case .mixedMetabolicCardioTraining: return "Mixed Metabolic Cardio Training"
        case .paddleSports:                 return "Paddle Sports"
        case .play:                         return "Play"
        case .preparationAndRecovery:       return "Preparation and Recovery"
        case .racquetball:                  return "Racquetball"
        case .rowing:                       return "Rowing"
        case .rugby:                        return "Rugby"
        case .running:                      return "Running"
        case .sailing:                      return "Sailing"
        case .skatingSports:                return "Skating Sports"
        case .snowSports:                   return "Snow Sports"
        case .soccer:                       return "Soccer"
        case .softball:                     return "Softball"
        case .squash:                       return "Squash"
        case .stairClimbing:                return "Stair Climbing"
        case .surfingSports:                return "Surfing Sports"
        case .swimming:                     return "Swimming"
        case .tableTennis:                  return "Table Tennis"
        case .tennis:                       return "Tennis"
        case .trackAndField:                return "Track and Field"
        case .traditionalStrengthTraining:  return "Traditional Strength Training"
        case .volleyball:                   return "Volleyball"
        case .walking:                      return "Walking"
        case .waterFitness:                 return "Water Fitness"
        case .waterPolo:                    return "Water Polo"
        case .waterSports:                  return "Water Sports"
        case .wrestling:                    return "Wrestling"
        case .yoga:                         return "Yoga"

        // iOS 10
        case .barre:                        return "Barre"
        case .coreTraining:                 return "Core Training"
        case .crossCountrySkiing:           return "Cross Country Skiing"
        case .downhillSkiing:               return "Downhill Skiing"
        case .flexibility:                  return "Flexibility"
        case .highIntensityIntervalTraining:    return "High Intensity Interval Training"
        case .jumpRope:                     return "Jump Rope"
        case .kickboxing:                   return "Kickboxing"
        case .pilates:                      return "Pilates"
        case .snowboarding:                 return "Snowboarding"
        case .stairs:                       return "Stairs"
        case .stepTraining:                 return "Step Training"
        case .wheelchairWalkPace:           return "Wheelchair Walk Pace"
        case .wheelchairRunPace:            return "Wheelchair Run Pace"

        // iOS 11
        case .taiChi:                       return "Tai Chi"
        case .mixedCardio:                  return "Mixed Cardio"
        case .handCycling:                  return "Hand Cycling"

        // iOS 13
        case .discSports:                   return "Disc Sports"
        case .fitnessGaming:                return "Fitness Gaming"

        // Catch-all
        default:                            return "Other"
        }
    }
    
    var image: String {
        switch self {
        case .americanFootball:             return "figure.american.football"
        case .archery:                      return "sportscourt"
        case .australianFootball:           return "figure.australian.football"
        case .badminton:                    return "sportscourt"
        case .baseball:                     return "figure.baseball"
        case .basketball:                   return "figure.basketball"
        case .bowling:                      return "figure.bowling"
        case .boxing:                       return "figure.boxing"
        case .climbing:                     return "figure.climbing"
        case .crossTraining:                return "figure.cross.training"
        case .curling:                      return "curling.stone"
        case .cycling:                      return "bicycle"
        case .dance:                        return "figure.dance"
        case .danceInspiredTraining:        return "figure.dance"
        case .elliptical:                   return "figure.elliptical"
        case .equestrianSports:             return "hare"
        case .fencing:                      return "figure.fencing"
        case .fishing:                      return "figure.fishing"
        case .functionalStrengthTraining:   return "figure.strengthtraining.traditional"
        case .golf:                         return "figure.golf"
        case .gymnastics:                   return "figure.gymnastics"
        case .handball:                     return "sportscourt"
        case .hiking:                       return "figure.hiking"
        case .hockey:                       return "figure.hockey"
        case .hunting:                      return "scope"
        case .lacrosse:                     return "figure.lacrosse"
        case .martialArts:                  return "figure.martial.arts"
        case .mindAndBody:                  return "figure.mind.and.body"
        case .mixedMetabolicCardioTraining: return "figure.mixed.cardio"
        case .paddleSports:                 return "figure.rowing"
        case .play:                         return "figure.play"
        case .preparationAndRecovery:       return "figure.preparation.and.recovery"
        case .racquetball:                  return "sportscourt"
        case .rowing:                       return "figure.rowing"
        case .rugby:                        return "figure.rugby"
        case .running:                      return "figure.run"
        case .sailing:                      return "sailboat"
        case .skatingSports:                return "figure.skating"
        case .snowSports:                   return "snowflake"
        case .soccer:                       return "figure.soccer"
        case .softball:                     return "sportscourt"
        case .squash:                       return "sportscourt"
        case .stairClimbing:                return "figure.stairs"
        case .surfingSports:                return "figure.surfing"
        case .swimming:                     return "figure.pool.swim"
        case .tableTennis:                  return "sportscourt"
        case .tennis:                       return "tennis.racket"
        case .trackAndField:                return "figure.track.and.field"
        case .traditionalStrengthTraining:  return "figure.strengthtraining.traditional"
        case .volleyball:                   return "figure.volleyball"
        case .walking:                      return "figure.walk"
        case .waterFitness:                 return "drop"
        case .waterPolo:                    return "figure.waterpolo"
        case .waterSports:                  return "figure.surfing"
        case .wrestling:                    return "figure.wrestling"
        case .yoga:                         return "figure.yoga"

        // iOS 10
        case .barre:                        return "figure.barre"
        case .coreTraining:                 return "figure.core.training"
        case .crossCountrySkiing:           return "figure.skiing.crosscountry"
        case .downhillSkiing:               return "figure.skiing.downhill"
        case .flexibility:                  return "figure.flexibility"
        case .highIntensityIntervalTraining: return "figure.highintensity.intervaltraining"
        case .jumpRope:                     return "figure.jumprope"
        case .kickboxing:                   return "figure.kickboxing"
        case .pilates:                      return "figure.pilates"
        case .snowboarding:                 return "figure.snowboarding"
        case .stairs:                       return "figure.stairs"
        case .stepTraining:                 return "figure.step.training"
        case .wheelchairWalkPace:           return "figure.roll"
        case .wheelchairRunPace:            return "figure.roll.fast"

        // iOS 11
        case .taiChi:                       return "figure.taichi"
        case .mixedCardio:                  return "figure.mixed.cardio"
        case .handCycling:                  return "hand.raised"

        // iOS 13
        case .discSports:                   return "figure.disc.sports"
        case .fitnessGaming:                return "gamecontroller"

        // Catch-all
        default:                            return "questionmark.circle"
        }
    }

    var color: Color {
        switch self {
        case .americanFootball:             return .orange
        case .archery:                      return .green
        case .australianFootball:           return .blue
        case .badminton:                    return .yellow
        case .baseball:                     return .red
        case .basketball:                   return .orange
        case .bowling:                      return .purple
        case .boxing:                       return .red
        case .climbing:                     return .brown
        case .crossTraining:                return .pink
        case .curling:                      return .gray
        case .cycling:                      return .blue
        case .dance:                        return .pink
        case .danceInspiredTraining:        return .purple
        case .elliptical:                   return .gray
        case .equestrianSports:             return .brown
        case .fencing:                      return .gray
        case .fishing:                      return .blue
        case .functionalStrengthTraining:   return .green
        case .golf:                         return .green
        case .gymnastics:                   return .pink
        case .handball:                     return .orange
        case .hiking:                       return .brown
        case .hockey:                       return .blue
        case .hunting:                      return .green
        case .lacrosse:                     return .purple
        case .martialArts:                  return .red
        case .mindAndBody:                  return .teal
        case .mixedMetabolicCardioTraining: return .pink
        case .paddleSports:                 return .blue
        case .play:                         return .yellow
        case .preparationAndRecovery:       return .gray
        case .racquetball:                  return .orange
        case .rowing:                       return .blue
        case .rugby:                        return .green
        case .running:                      return .red
        case .sailing:                      return .blue
        case .skatingSports:                return .cyan
        case .snowSports:                   return .cyan
        case .soccer:                       return .green
        case .softball:                     return .yellow
        case .squash:                       return .orange
        case .stairClimbing:                return .gray
        case .surfingSports:                return .blue
        case .swimming:                     return .teal
        case .tableTennis:                  return .orange
        case .tennis:                       return .green
        case .trackAndField:                return .red
        case .traditionalStrengthTraining:  return .green
        case .volleyball:                   return .orange
        case .walking:                      return .gray
        case .waterFitness:                 return .blue
        case .waterPolo:                    return .blue
        case .waterSports:                  return .teal
        case .wrestling:                    return .red
        case .yoga:                         return .purple

        // iOS 10
        case .barre:                        return .purple
        case .coreTraining:                 return .green
        case .crossCountrySkiing:           return .cyan
        case .downhillSkiing:               return .blue
        case .flexibility:                  return .yellow
        case .highIntensityIntervalTraining: return .red
        case .jumpRope:                     return .orange
        case .kickboxing:                   return .red
        case .pilates:                      return .purple
        case .snowboarding:                 return .cyan
        case .stairs:                       return .gray
        case .stepTraining:                 return .orange
        case .wheelchairWalkPace:           return .blue
        case .wheelchairRunPace:            return .blue

        // iOS 11
        case .taiChi:                       return .teal
        case .mixedCardio:                  return .pink
        case .handCycling:                  return .blue

        // iOS 13
        case .discSports:                   return .yellow
        case .fitnessGaming:                return .purple

        // Catch-all
        default:                            return .gray
        }
    }

}
