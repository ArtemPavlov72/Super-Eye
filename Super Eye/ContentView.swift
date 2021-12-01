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
                    Image(systemName: "person.circle.fill")
                    Text("Главная")
            }
            SettingsView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
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
