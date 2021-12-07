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
    var counter = 60
    var timer: Timer?
    var titleOfExercise = "Управжение 1"
    
    
    
}
