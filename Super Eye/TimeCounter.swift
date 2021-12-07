//
//  TimeCounter.swift
//  Super Eye
//
//  Created by iMac on 06.12.2021.
//

import Foundation
import Combine
import SwiftUI

enum CurrentExercise {
    case relaxation, blinking, main, stop
}

class TimeCounter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    
    var currentExercise = CurrentExercise.blinking
    
    var counter = 3
    var timer: Timer?
    var titleOfExercise = "Расслабление"
    
    func startTimer() {
        if counter >= 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
     //   titleOfExerciseDidChanged()
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
           // killTimer()
            titleOfExerciseDidChanged()
        }
        objectWillChange.send(self)
        
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func titleOfExerciseDidChanged() {
        
        switch currentExercise {
        case .relaxation:
            counter = 3
            titleOfExercise = "Расслабление"
            currentExercise = .blinking
        case .blinking:
            counter = 2
            titleOfExercise = "Быстро моргаем"
            currentExercise = .main
        case .main:
            counter = 5
            titleOfExercise = "Основное упражнение"
            currentExercise = .stop
        case .stop:
            killTimer()
            currentExercise = .relaxation
            
        }
        objectWillChange.send(self)
    }
    
}
