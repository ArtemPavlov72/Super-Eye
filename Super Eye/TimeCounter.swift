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

    var currentExercise = TypeOfExercise.blinking
    
    var counter = TypeOfExercise.relaxation.exerciseData.duration
    var titleOfExercise = TypeOfExercise.relaxation.exerciseData.name
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
    
    //логика смены упражнений
    private func titleOfExerciseDidChanged() {
        
        if playStop {
            switch currentExercise {
            case .relaxation:
                counter = TypeOfExercise.relaxation.exerciseData.duration
                titleOfExercise = TypeOfExercise.relaxation.exerciseData.name
                currentExercise = .blinking
            case .blinking:
                counter = TypeOfExercise.blinking.exerciseData.duration
                titleOfExercise = TypeOfExercise.blinking.exerciseData.name
                currentExercise = .upDown
            case .upDown:
                counter = TypeOfExercise.upDown.exerciseData.duration
                titleOfExercise = TypeOfExercise.upDown.exerciseData.name
                currentExercise = .leftRight
            case .leftRight:
                counter = TypeOfExercise.leftRight.exerciseData.duration
                titleOfExercise = TypeOfExercise.leftRight.exerciseData.name
                currentExercise = .diagonalHL
            case .diagonalHL:
                counter = TypeOfExercise.diagonalHL.exerciseData.duration
                titleOfExercise = TypeOfExercise.diagonalHL.exerciseData.name
                currentExercise = .diagonalLH
            case .diagonalLH:
                counter = TypeOfExercise.diagonalLH.exerciseData.duration
                titleOfExercise = TypeOfExercise.diagonalLH.exerciseData.name
                currentExercise = .squareClockwise
            case .squareClockwise:
                counter = TypeOfExercise.squareClockwise.exerciseData.duration
                titleOfExercise = TypeOfExercise.squareClockwise.exerciseData.name
                currentExercise = .squareCounterClockwise
            case .squareCounterClockwise:
                counter = TypeOfExercise.squareCounterClockwise.exerciseData.duration
                titleOfExercise = TypeOfExercise.squareCounterClockwise.exerciseData.name
                currentExercise = .circleClockwise
            case .circleClockwise:
                counter = TypeOfExercise.circleClockwise.exerciseData.duration
                titleOfExercise = TypeOfExercise.circleClockwise.exerciseData.name
                currentExercise = .circleConterClockwise
            case .circleConterClockwise:
                counter = TypeOfExercise.circleConterClockwise.exerciseData.duration
                titleOfExercise = TypeOfExercise.circleConterClockwise.exerciseData.name
                currentExercise = .slide
            case .slide:
                counter = TypeOfExercise.slide.exerciseData.duration
                titleOfExercise = TypeOfExercise.slide.exerciseData.name
                currentExercise = .snake
            case .snake:
                counter = TypeOfExercise.snake.exerciseData.duration
                titleOfExercise = TypeOfExercise.snake.exerciseData.name
                currentExercise = .distance
            case .distance:
                counter = TypeOfExercise.distance.exerciseData.duration
                titleOfExercise = TypeOfExercise.distance.exerciseData.name
                playStop.toggle()
            }
        } else {
            killTimer()
            playStop.toggle()
            isPaused = true
            titleOfExercise = TypeOfExercise.relaxation.exerciseData.name
            counter = TypeOfExercise.relaxation.exerciseData.duration
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
