//
//  SettingsView.swift
//  Super Eye
//
//  Created by iMac on 01.12.2021.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var AboutExercises = false
    
    var body: some View {
        NavigationView {
            List() {
                Text("Звуковое сопровождение")
                Text("Сбросить статистику")
                Text("Настроить расписание")
                Text("О приложении")
                Text("Связь с разработчиком")
            }
            .navigationTitle("Настройки")
            .listStyle(.plain)
        }
        
    }

}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
