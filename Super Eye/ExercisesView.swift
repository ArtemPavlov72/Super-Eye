//
//  ExercisesView.swift
//  Super Eye
//
//  Created by iMac on 03.12.2021.
//

import SwiftUI

struct ExercisesView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var timer = ExerciseChanger()
    @State private var animation = false
    @State private var AboutExercises = false
    @State private var displayedExerciseInfo = ""
    
    let exercises: [Exercise]
    
    var animationIsOn: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
    }
    
    //разгрузить боди (можно вынести анимацию в отдельный view и создать зависимость анимации от названия упражнения
    var body: some View {
        NavigationView {
            VStack {
                //ExerciseInfoView(exerciseInfo:)
                HStack {
                    Text("\(timer.titleOfExercise)")
                        .frame(height: 45)
                    Spacer()
                    Text(displayTimer())
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
                    Image(systemName: timer.buttonImage) //меняем картинку кнопки
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
        timer.buttonDidTapped()
        withAnimation {
            animation.toggle()
        }
    }
    
    private func displayTimer() -> String {
        if timer.timer != nil {
            return "\(timer.counter)"
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

struct ExerciseInfoView: View {
    let exerciseInfo: String
    var body: some View {
        Text("")
    }
    
    
}
