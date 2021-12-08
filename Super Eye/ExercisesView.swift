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
                    Image(systemName: "play.fill")
                        .foregroundColor(Color.mint.opacity(0.8))
                    //.resizable()
                        .scaleEffect(1.4)
                        .padding()
                }
                )

                    .toolbar {
                        ToolbarItem {
                            Button("Закончить зарядку") {
                                presentationMode.wrappedValue.dismiss()
                                
                            }
                        }
                    }
            }
        }
    }
    private func buttonAction() {
        timer.startTimer()
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
