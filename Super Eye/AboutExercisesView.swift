//
//  AboutExercisesView.swift
//  Super Eye
//
//  Created by iMac on 09.12.2021.
//

import SwiftUI

struct AboutExercisesView: View {
    
    let exercises: [Exercise]
    
    var body: some View {
        NavigationView{
            List(exercises) { exercise in
                Section(header: Text(exercise.name)) {
                    Text(exercise.description)
                    Text("Рекомендуемое время на упражнение \(exercise.timeOfExercise)сек")
                }
            }
            .navigationTitle("Инструкция")
            .listStyle(.plain)
        }
    }
}

struct AboutExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        AboutExercisesView(exercises: Exercise.getExercisesList())
    }
}
