//
//  Exercise.swift
//  Super Eye
//
//  Created by Artem Pavlov on 18.12.2021.
//

struct Exercise: Identifiable {
    var id: Int
    let name: String
    let description: String
    let duration: Int
    
    static func getExercisesList() -> [Exercise] {
        
        var exercises: [Exercise] = []
        
        for exerciseCase in TypeOfExercise.allCases {
            let exercise = Exercise(
                id: exerciseCase.exerciseData.id,
                name: exerciseCase.exerciseData.name,
                description: exerciseCase.exerciseData.description,
                duration: exerciseCase.exerciseData.duration
            )
            exercises.append(exercise)
        }
        return exercises
    }
}

enum TypeOfExercise: CaseIterable {
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
    
    var exerciseData: Exercise {
        switch self {
        case .relaxation:
            return Exercise(
                id: 1,
                name: "Расслабляем глаза",
                description: "Закрываем глаза руками и пытаемся расслабиться",
                duration: TimerDuration.longExercise.durationValue
            )
        case .blinking:
            return Exercise(
                id: 2,
                name: "Быстро моргаем",
                description: "Закрываем и открываем глаза быстрыми движениями",
                duration: TimerDuration.shortExercise.durationValue
            )
        case .upDown:
            return Exercise(
                id: 3,
                name: "Вверх-вниз",
                description: "Совершаем повторяющиеся движения, смотрим сначала вверх, затем вниз",
                duration: TimerDuration.mediumExercise.durationValue
            )
        case .leftRight:
            return Exercise(
                id: 4,
                name: "Влево-вправо",
                description: "Совершаем повторяющиеся движения, смотрим сначала вправо, затем влево",
                duration: TimerDuration.mediumExercise.durationValue
            )
        case .diagonalHL:
            return Exercise(
                id: 5,
                name: "Диагональ слева на право",
                description: "Совершаем повторяющиеся движения по диагонали, от левого нижнего угла к верхнему правому углу",
                duration: TimerDuration.mediumExercise.durationValue
            )
        case .diagonalLH:
            return Exercise(
                id: 6,
                name: "Диагональ справа на лево",
                description: "Совершаем повторяющиеся движения по диагонали, от левого верхнего угла к нижнему правому углу",
                duration: TimerDuration.mediumExercise.durationValue
            )
        case .squareClockwise:
            return Exercise(
                id: 7,
                name: "Квадрат по часовой стрелке",
                description: "Рисуем квадрат по часовой стрелке",
                duration: TimerDuration.mediumExercise.durationValue
            )
        case .squareCounterClockwise:
            return Exercise(
                id: 8,
                name: "Квадрат против часовой стрелки",
                description: "Рисуем квадрат против часовой стрелки",
                duration: TimerDuration.mediumExercise.durationValue
            )
        case .circleClockwise:
            return Exercise(
                id: 9,
                name: "Круг по часовой стрелке",
                description: "Медленными движениями совершаем круговые движения глазами по часовой стрелке",
                duration: TimerDuration.mediumExercise.durationValue
            )
        case .circleConterClockwise:
            return Exercise(
                id: 10,
                name: "Круг против часовой стрелки",
                description: "Медленными движениями совершаем круговые движения глазами против часовой стрелки",
                duration: TimerDuration.mediumExercise.durationValue
            )
        case .slide:
            return Exercise(
                id: 11,
                name: "Горка",
                description: "Медленными движениями сначала слева на право рисуем глазами горки, затем совершаем аналогичные движения в обратную сторону",
                duration: TimerDuration.mediumExercise.durationValue
            )
        case .snake:
            return Exercise(
                id: 12,
                name: "Змейка",
                description: "Медленными движениями сначала сверху в низ спускаемся глазами змеиными движениями, затем совершаем аналогичные движения в обратную сторону",
                duration: TimerDuration.mediumExercise.durationValue
            )
        case .distance:
            return Exercise(
                id: 13,
                name: "Смотрим в даль",
                description: "Выставляем палец перед носом на расстоянии примерно 10 см, поочередно смотрим на палец перед глазами, затем на любой дальний объект, например здание или шкаф",
                duration: TimerDuration.longExercise.durationValue
            )
        }
    }
    
    enum TimerDuration {
        case longExercise,
             mediumExercise,
             shortExercise
        
        var durationValue: Int {
            switch self {
            case .longExercise:
                return 3
            case .mediumExercise:
                return 1
            case .shortExercise:
                return 2
            }
        }
    }
}

