//
//  MainView.swift
//  Super Eye
//
//  Created by iMac on 01.12.2021.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    @State private var exercisesViewPresented = false
    
    var body: some View {
        NavigationView{
            Button("Начать зарядку") {
                exercisesViewPresented = true
                AudioServicesPlaySystemSound(1022)
            }
            .fullScreenCover(isPresented: $exercisesViewPresented) {
                ExercisesView()
            }
            .navigationTitle("Упражнения")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
