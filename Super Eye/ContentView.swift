//
//  ContentView.swift
//  Super Eye
//
//  Created by iMac on 01.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "eyebrow")
                    Text("Упражнения")
                        
            }
             
            AboutExercisesView()
                .tabItem {
                    Image(systemName: "questionmark.app")
                    Text("Инструкция")
                        
            }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "slider.vertical.3")
                    Text("Настройки")
                }
               
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
