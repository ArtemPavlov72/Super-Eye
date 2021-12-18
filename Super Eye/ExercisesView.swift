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
                    Spacer(minLength: 120)
                    EyeView()
                        .frame(width: 50, height: 50)
                    
                        .rotationEffect(.degrees(animation ? 360 : 0))
                        .animation(animation ? animationIsOn : .default, value: animation)
                    Spacer()
                    EyeView()
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(animation ? 360 : 0))
                        .animation(animation ? animationIsOn : .default, value: animation)
                    Spacer(minLength: 120)
                }
                Spacer()
                
                Button(action: {buttonAction()}, label: {
                    Image(systemName: timer.buttonImage) //меняем картинку кнопки
                        .foregroundColor(Color.mint.opacity(0.8))
                    //.resizable()
                        .scaleEffect(1.4)
                        .padding()
                }
                )
                
                    .toolbar {
                        ToolbarItem {
                            HStack {
                                Button(action: {AboutExercises = true}, label: {
                                   // Text("?")
                                    Image(systemName: "questionmark.app.dashed")
                                }
                                )
                                Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                                    //Text("X")
                                    Image(systemName: "xmark.app")
                                }
                                )
                                
                            }
                        }
                    }
            }
        }
        .sheet(isPresented: $AboutExercises) {
            AboutExercisesView()
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
        ExercisesView()
    }
}
