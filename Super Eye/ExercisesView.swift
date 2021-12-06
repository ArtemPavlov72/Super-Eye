//
//  ExercisesView.swift
//  Super Eye
//
//  Created by iMac on 03.12.2021.
//

import SwiftUI

struct ExercisesView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Название упражнения")
                    Spacer()
                    Text(Date().addingTimeInterval(60), style: .timer) //надо будет сделать таймер
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
                
                Button(action: {}, label: {
                    Image(systemName: "pause.fill")
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
