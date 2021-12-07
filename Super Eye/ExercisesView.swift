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
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("\(timer.titleOfExercise)")
                    Spacer()
                    Text("\(timer.counter)") //надо будет сделать таймер
                }
                .padding(.horizontal)
                Spacer()
                HStack{
                    Spacer(minLength: 120)
                    EyeView()
                        .frame(width: 50, height: 50)
                    Spacer()
                    EyeView()
                        .frame(width: 50, height: 50)
                    Spacer(minLength: 120)
                }
                Spacer()
                
                Button(action: {timer.startTimer()}, label: {
                    Image(systemName: "play.fill")
                        .foregroundColor(Color.mint.opacity(0.8))
                    //.resizable()
                        .scaleEffect(1.4)
                })
                
                
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
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
