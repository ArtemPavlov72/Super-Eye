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
    case relaxation, blinking, main
}

class TimeCounter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    
    var currentExercise = CurrentExercise.relaxation
    
    var counter = 7
    var timer: Timer?
    var titleOfExercise = "Расслабление"
    
    func startTimer() {
        if counter > 0 {
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
            killTimer()
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
            counter = 7
            titleOfExercise = "Расслабление"
            currentExercise = .blinking
        case .blinking:
            counter = 5
            titleOfExercise = "Быстро моргаем"
            currentExercise = .main
        case .main:
            counter = 10
            titleOfExercise = "Основное упражнение"
        }
        objectWillChange.send(self)
    }
    
}
