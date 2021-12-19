//
//  Exercise.swift
//  Super Eye
//
//  Created by iMac on 18.12.2021.
//

import SwiftUI

struct Exercise: Identifiable {
    let id: Int
    let name: String
    let description: String
    let timeOfExercise: Int
    
    static func getExercisesList() -> [Exercise] {
        
        var exercises: [Exercise] = []
        
        let names = DataManager.shared.nameOfExercises
        let descriptions = DataManager.shared.descriptionOfExercises
        let timeOfExercises = DataManager.shared.timeOfExercise
        
        for index in 0..<names.count {
            let exercise = Exercise(
                id: index + 1,
                name: names[index],
                description: descriptions[index],
                timeOfExercise: timeOfExercises[index]
            )
            exercises.append(exercise)
        }
        return exercises
    }
    
}
