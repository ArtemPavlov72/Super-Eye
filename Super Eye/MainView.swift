//
//  MainView.swift
//  Super Eye
//
//  Created by iMac on 01.12.2021.
//

import SwiftUI

struct MainView: View {
    @State private var exercisesViewPresented = false
    
    var body: some View {
        Button("Начать зарядку") {
            exercisesViewPresented = true
        }
        .fullScreenCover(isPresented: $exercisesViewPresented) {
            ExercisesView()
        }
    
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
