//
//  TimeCounter.swift
//  Super Eye
//
//  Created by iMac on 06.12.2021.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    
    var currentExercise = Exercises.blinking
    var counter = Exercises.relaxation.exerciseData.duration
    var titleOfExercise = Exercises.relaxation.exerciseData.name
    var isPaused = true
    var timer: Timer?
    var buttonImage = "play.fill"
    
    var playStop = true
    
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
        
        if playStop {
            switch currentExercise {
            case .relaxation:
                counter = Exercises.relaxation.exerciseData.duration
                titleOfExercise = Exercises.relaxation.exerciseData.name
                currentExercise = .blinking
            case .blinking:
                counter = Exercises.blinking.exerciseData.duration
                titleOfExercise = Exercises.blinking.exerciseData.name
                currentExercise = .upDown
            case .upDown:
                counter = Exercises.upDown.exerciseData.duration
                titleOfExercise = Exercises.upDown.exerciseData.name
                currentExercise = .leftRight
            case .leftRight:
                counter = Exercises.leftRight.exerciseData.duration
                titleOfExercise = Exercises.leftRight.exerciseData.name
                currentExercise = .diagonalHL
            case .diagonalHL:
                counter = Exercises.diagonalHL.exerciseData.duration
                titleOfExercise = Exercises.diagonalHL.exerciseData.name
                currentExercise = .diagonalLH
            case .diagonalLH:
                counter = Exercises.diagonalLH.exerciseData.duration
                titleOfExercise = Exercises.diagonalLH.exerciseData.name
                currentExercise = .squareClockwise
            case .squareClockwise:
                counter = Exercises.squareClockwise.exerciseData.duration
                titleOfExercise = Exercises.squareClockwise.exerciseData.name
                currentExercise = .squareCounterClockwise
            case .squareCounterClockwise:
                counter = Exercises.squareCounterClockwise.exerciseData.duration
                titleOfExercise = Exercises.squareCounterClockwise.exerciseData.name
                currentExercise = .circleClockwise
            case .circleClockwise:
                counter = Exercises.circleClockwise.exerciseData.duration
                titleOfExercise = Exercises.circleClockwise.exerciseData.name
                currentExercise = .circleConterClockwise
            case .circleConterClockwise:
                counter = Exercises.circleConterClockwise.exerciseData.duration
                titleOfExercise = Exercises.circleConterClockwise.exerciseData.name
                currentExercise = .slide
            case .slide:
                counter = Exercises.slide.exerciseData.duration
                titleOfExercise = Exercises.slide.exerciseData.name
                currentExercise = .snake
            case .snake:
                counter = Exercises.snake.exerciseData.duration
                titleOfExercise = Exercises.snake.exerciseData.name
                currentExercise = .distance
            case .distance:
                counter = Exercises.distance.exerciseData.duration
                titleOfExercise = Exercises.distance.exerciseData.name
                playStop.toggle()
            }
        } else {
            killTimer()
            playStop.toggle()
            isPaused = true
            titleOfExercise = Exercises.relaxation.exerciseData.name
            counter = Exercises.relaxation.exerciseData.duration
            currentExercise = .blinking
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
