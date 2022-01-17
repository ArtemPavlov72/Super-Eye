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
    
    var isPaused = true
    var timer: Timer?
    var buttonImage = "play.fill"
    var playStop = true
    
    var exerciseTitle = "relaxation" //для повторения кейса морганий
    
    //переименовать название
    func buttonDidTapped() {
        if isPaused {
            startTimer()
            isPaused = false
            playPauseChanged()
        } else {
            stopTimer()
            isPaused = true
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
                idOfExercise = currentExercise.exerciseData.id
                
                //функцию сделать, где будет приниматься значение текущего кейса, как в уроке 1.7 перечисления
                switch exerciseTitle {
                case "relaxation":
                    currentExercise = .upDown
                case "upDown":
                    currentExercise = .leftRight
                case "leftRight":
                    currentExercise = .diagonalHL
                case "diagonalHL":
                    currentExercise = .diagonalLH
                case "diagonalLH":
                    currentExercise = .squareClockwise
                case "squareClockwise":
                    currentExercise = .squareCounterClockwise
                case "squareCounterClockwise":
                    currentExercise = .circleClockwise
                case "circleClockwise":
                    currentExercise = .circleConterClockwise
                case "circleConterClockwise":
                    currentExercise = .slide
                case "slide":
                    currentExercise = .snake
                case "snake":
                    currentExercise = .distance
                default:
                    currentExercise = .leftRight
                }
                
            case .upDown:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                exerciseTitle = "upDown"
                currentExercise = .blinking
            case .leftRight:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                exerciseTitle = "leftRight"
                currentExercise = .blinking
            case .diagonalHL:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                exerciseTitle = "diagonalHL"
                currentExercise = .blinking
            case .diagonalLH:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                exerciseTitle = "diagonalLH"
                currentExercise = .blinking
            case .squareClockwise:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                exerciseTitle = "squareClockwise"
                currentExercise = .blinking
            case .squareCounterClockwise:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                exerciseTitle = "squareCounterClockwise"
                currentExercise = .blinking
            case .circleClockwise:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                exerciseTitle = "circleClockwise"
                currentExercise = .blinking
            case .circleConterClockwise:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                exerciseTitle = "circleConterClockwise"
                currentExercise = .blinking
            case .slide:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                exerciseTitle = "slide"
                currentExercise = .blinking
            case .snake:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                exerciseTitle = "snake"
                currentExercise = .blinking
            case .distance:
                counter = currentExercise.exerciseData.duration
                titleOfExercise = currentExercise.exerciseData.name
                idOfExercise = currentExercise.exerciseData.id
                exerciseTitle = "relaxation"
                playStop.toggle()
            }
        } else {
            killTimer()
            playStop.toggle()
            isPaused = true
            currentExercise = .relaxation
            titleOfExercise = "Приготовились..."
            counter = 2
            
        }
        objectWillChange.send(self)
    }
}

enum BlinkingRepeat {
    case relaxation,
         blinking,
         upDown,
         leftRight,
         diagonalHL,
         diagonalLH,
         squareClockwise,
         squareCounterClockwise,
         circleClockwise,
         circleConterClockwise,
         slide,
         snake,
         distance
}
