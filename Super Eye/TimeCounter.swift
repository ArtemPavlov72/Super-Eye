//
//  TimeCounter.swift
//  Super Eye
//
//  Created by iMac on 06.12.2021.
//

import Foundation
import Combine

enum CurrentExercise {
    case relaxation,
         blinking,
         main,
         stop
}

enum CurrentTimer {
    case small, middle, max
}

class TimeCounter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    
    var currentExercise = CurrentExercise.relaxation
    
   // let exercises: [Exercise]
    
    var isPaused = true
    var counter = 3
    var timer: Timer?
    var titleOfExercise = "Расслабление"
    var buttonImage = "play.fill"
    
    //переименовать название
    func pauseResume() {
        if isPaused {
            startTimer()
            isPaused = false
            buttonDidTapped()
        } else {
            stopTimer()
            isPaused = true
            buttonDidTapped()
        }
    }
    
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
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            titleOfExerciseDidChanged()
        }
        objectWillChange.send(self)
    }
    
    //останавливаем таймер и выгружаем
    private func killTimer() {
        timer?.invalidate()
        timer = nil
        buttonImage = "play.fill"
    }
    
    //останавливаем таймер, но не выгружаем
    private func stopTimer() {
        timer?.invalidate()
        
    }
    
    //временная логика для понимания работоспособности
    private func titleOfExerciseDidChanged() {
        let longExercise = 15
        let mediumExercise = 10
        let fastExercise = 5
        
        switch currentExercise {
        case .relaxation:
            counter = longExercise
            titleOfExercise = "Расслабление"
            currentExercise = .blinking
        case .blinking:
            counter = fastExercise
            titleOfExercise = "Быстро моргаем"
            currentExercise = .main
        case .main:
            counter = mediumExercise
            titleOfExercise = "Основное упражнение"
            currentExercise = .stop
        case .stop:
            killTimer()
            isPaused = true
            titleOfExercise = "Упражнения завершены!"
            currentExercise = .relaxation
            
        }
        objectWillChange.send(self)
    }
    // смена картинки кнопки
    private func buttonDidTapped() {
        if buttonImage == "pause.fill" {
            stopTimer()
            buttonImage = "play.fill"
        } else {
            if buttonImage == "play.fill" {
                buttonImage = "pause.fill"
            }
        }
    }
}
