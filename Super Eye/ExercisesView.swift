//
//  ExercisesView.swift
//  Super Eye
//
//  Created by Artem Pavlov on 03.12.2021.
//

import SwiftUI

struct ExercisesView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var exercise = ExerciseChanger()
    @State private var animation = false
    @State private var AboutExercises = false
    @State private var displayedExerciseText = ""
    @State private var displayedExerciseCount = ""
    
    let exercises: [Exercise]
    
    var animationIsOn: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
    }
    
    //разгрузить боди (можно вынести анимацию в отдельный view и создать зависимость анимации от названия упражнения
    var body: some View {
        NavigationView {
            VStack {
               HStack {
                    Text(checkExerciseTextDidLoad())
                        .frame(height: 45)
                    Spacer()
                    Text(checkExerciseCountDidLoad())
                }
                .padding(.horizontal)
                Spacer()
                HStack{
                    Spacer(minLength: 135)
                    EyeView()
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(animation ? 360 : 0))
                        .animation(animation ? animationIsOn : .default, value: animation)
                    Spacer()
                    EyeView()
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(animation ? 360 : 0))
                        .animation(animation ? animationIsOn : .default, value: animation)
                    Spacer(minLength: 135)
                }
                Spacer()
                
                Button(action: {buttonAction()}, label: {
                    Image(systemName: exercise.buttonImage) //меняем картинку кнопки
                        .foregroundColor(Color.mint.opacity(0.8))
                        .scaleEffect(1.4)
                        .padding()
                }
                )
                    .toolbar {
                        ToolbarItem {
                            HStack {
                                Button(action: {AboutExercises = true}, label: {
                                    Image(systemName: "questionmark.app.dashed")
                                }
                                )
                                Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                                    Image(systemName: "xmark.app")
                                }
                                )
                            }
                        }
                    }
            }
        }
        .sheet(isPresented: $AboutExercises) {
            AboutExercisesView(exercises: exercises)
        }
    }
    private func buttonAction() {
        exercise.buttonPlayDidTapped()
        
        withAnimation {
            animation.toggle()
        }
    }

    private func checkExerciseTextDidLoad() -> String {
        if exercise.timer != nil {
            return exercise.titleOfExercise
        } else {
            return "Нажмите PLAY чтобы начать упражнения"
        }
    }
    
    private func checkExerciseCountDidLoad() -> String {
        if exercise.timer != nil {
            return "\(exercise.counter)"
        } else {
            return ""
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(exercises: Exercise.getExercisesList())
    }
}

