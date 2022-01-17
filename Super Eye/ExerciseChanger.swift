//
//  TimeCounter.swift
//  Super Eye
//
//  Created by iMac on 06.12.2021.
//

import Foundation
import Combine

class ExerciseChanger: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ExerciseChanger, Never>()
    
    var currentExercise = TypeOfExercise.relaxation
    var counter = 2
    var titleOfExercise = "Приготовились..." //Нажмите PLAY чтобы начать упражнения
    var idOfExercise = 0
    
    var timerIsPaused = true
    var timer: Timer?
    var buttonImage = "play.fill"
    var playStop = true
    
    //переименовать название
    func buttonPlayDidTapped() {
        if timerIsPaused {
            startTimer()
            timerIsPaused = false
            playPauseChanged()
        } else {
            stopTimer()
            timerIsPaused = true
            playPauseChanged()
        }
    }
    
    // смена картинки кнопки
    private func playPauseChanged() {
        if buttonImage == "pause.fill" {
            stopTimer()
            buttonImage = "play.fill"
        } else {
            if buttonImage == "play.fill" {
                buttonImage = "pause.fill"
            }
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
            exerciseDidChanged()
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
    private func exerciseDidChanged() {
        if playStop {
            switch currentExercise {
            case .relaxation:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                currentExercise = .blinking
            case .blinking:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                switch idOfExercise {
                case 1:
                    currentExercise = .upDown
                case 3:
                    currentExercise = .leftRight
                case 4:
                    currentExercise = .diagonalHL
                case 5:
                    currentExercise = .diagonalLH
                case 6:
                    currentExercise = .squareClockwise
                case 7:
                    currentExercise = .squareCounterClockwise
                case 8:
                    currentExercise = .circleClockwise
                case 9:
                    currentExercise = .circleConterClockwise
                case 10:
                    currentExercise = .slide
                case 11:
                    currentExercise = .snake
                case 12:
                    currentExercise = .distance
                default:
                    currentExercise = .relaxation
                }
            case .upDown:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                currentExercise = .blinking
            case .leftRight:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                currentExercise = .blinking
            case .diagonalHL:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                currentExercise = .blinking
            case .diagonalLH:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                currentExercise = .blinking
            case .squareClockwise:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                currentExercise = .blinking
            case .squareCounterClockwise:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                currentExercise = .blinking
            case .circleClockwise:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                currentExercise = .blinking
            case .circleConterClockwise:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                currentExercise = .blinking
            case .slide:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                currentExercise = .blinking
            case .snake:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                currentExercise = .blinking
            case .distance:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                playStop.toggle()
            }
        } else {
            killTimer()
            playStop.toggle()
            timerIsPaused = true
            currentExercise = .relaxation
            titleOfExercise = "Приготовились..."
            counter = 2
        }
        objectWillChange.send(self)
    }
}

