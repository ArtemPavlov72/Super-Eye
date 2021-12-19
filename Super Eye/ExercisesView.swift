//
//  ExercisesView.swift
//  Super Eye
//
//  Created by iMac on 03.12.2021.
//

import SwiftUI

struct ExercisesView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var timer = TimeCounter()
    
    @State private var animation = false
    @State private var AboutExercises = false
    
    let exercises: [Exercise]
    
    var animationIsOn: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("\(timer.titleOfExercise)")
                    Spacer()
                    Text("\(timer.counter)")
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
            AboutExercisesView(exercises: Exercise.getExercisesList())
        }
    }
    private func buttonAction() {
        timer.pauseResume()
        withAnimation {
            animation.toggle()
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(exercises: Exercise.getExercisesList())
    }
}
