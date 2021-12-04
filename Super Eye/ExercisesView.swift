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
            Text("Номер приложения")
                    Spacer()
                    Text(Date().addingTimeInterval(60), style: .timer) //надо будет сделать таймер
                }
            Spacer()
                HStack{
                EyeView()
                    .frame(width: 80, height: 80)
                    EyeView()
                        .frame(width: 80, height: 80)
                }
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "pause.fill")
                })
                
                
                .toolbar {
                    ToolbarItem {
                        Button("Закончить зарядку") {
                            presentationMode.wrappedValue.dismiss()
                            
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
