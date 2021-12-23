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
                Section(header: Text(exercise.name).bold()) {
                    Text(exercise.description)
                    
                    HStack{
                        Spacer(minLength: 135)
                        EyeView()
                            .frame(width: 30, height: 30)
                            
                            
                        Spacer()
                        EyeView()
                            .frame(width: 30, height: 30)
                            
                            
                        Spacer(minLength: 135)
                    }
                    
                    Text("Время на упражнение \(exercise.duration) секунд")
                        //.font(.caption)
                        
                }
            }
            .navigationTitle("Инструкция")
            //.listStyle(.plain)
        }
    }
}

struct AboutExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        AboutExercisesView(exercises: Exercise.getExercisesList())
    }
}
