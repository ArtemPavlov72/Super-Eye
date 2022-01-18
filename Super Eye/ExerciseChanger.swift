//
//  TimeCounter.swift
//  Super Eye
//
//  Created by Artem Pavlov on 06.12.2021.
//

import Foundation
import Combine

class ExerciseChanger: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ExerciseChanger, Never>()
    
    // MARK: - Public Properties
    var currentExercise = TypeOfExercise.relaxation
    var titleOfExercise = "Приготовились..."
    var counter = 2
    var idOfExercise = 0
    
    var timer: Timer?
    var buttonImage = "play.fill"
    
    // MARK: - Private Properties
    private var timerIsPaused = true
    private var playStop = true
    
    // MARK: - Public Methods
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
}

// MARK: - Change Button Image Logic
extension ExerciseChanger {
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
}

// MARK: - Timer Private Methods
extension ExerciseChanger {
    private func startTimer() {
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
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
        buttonImage = "play.fill"
    }
    
    private func stopTimer() {
        timer?.invalidate()
    }
}

// MARK: - Exercise Changing Logic
extension ExerciseChanger {
    private func exerciseDidChanged() {
        if playStop {
            switch currentExercise {
            case .relaxation:
                getPropertiesOfExercise(withId: true, withCurrentExercise: true)
            case .blinking:
                getPropertiesOfExercise(withId: false, withCurrentExercise: false)
                blinkingRepeat()
            case .upDown:
                getPropertiesOfExercise(withId: true, withCurrentExercise: true)
            case .leftRight:
                getPropertiesOfExercise(withId: true, withCurrentExercise: true)
            case .diagonalHL:
                getPropertiesOfExercise(withId: true, withCurrentExercise: true)
            case .diagonalLH:
                getPropertiesOfExercise(withId: true, withCurrentExercise: true)
            case .squareClockwise:
                getPropertiesOfExercise(withId: true, withCurrentExercise: true)
            case .squareCounterClockwise:
                getPropertiesOfExercise(withId: true, withCurrentExercise: true)
            case .circleClockwise:
                getPropertiesOfExercise(withId: true, withCurrentExercise: true)
            case .circleConterClockwise:
                getPropertiesOfExercise(withId: true, withCurrentExercise: true)
            case .slide:
                getPropertiesOfExercise(withId: true, withCurrentExercise: true)
            case .snake:
                getPropertiesOfExercise(withId: true, withCurrentExercise: true)
            case .distance:
                getPropertiesOfExercise(withId: true, withCurrentExercise: false)
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
    
    private func blinkingRepeat() {
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
        default:
            currentExercise = .distance
        }
    }
    
    private func getPropertiesOfExercise(withId: Bool, withCurrentExercise: Bool) {
        counter = currentExercise.exerciseData.duration
        titleOfExercise = currentExercise.exerciseData.name
        if withId {
            idOfExercise = currentExercise.exerciseData.id
        }
        if withCurrentExercise {
            currentExercise = .blinking
        }
    }
}
