//
//  DataManager.swift
//  Super Eye
//
//  Created by iMac on 18.12.2021.
//
/*
import Foundation
class DataManager {
    
    static let shared = DataManager()
    
    enum Exercise: CaseIterable {
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
        
        var name: String {
            switch self {
                
            case .relaxation:
                return "Расслабляем глаза"
            case .blinking:
                return "Быстро моргаем"
            case .upDown:
                return "Вверх-вниз"
            case .leftRight:
                return "Влево-вправо"
            case .diagonalHL:
                return "Диагональ слева на право"
            case .diagonalLH:
                return "Диагональ справа на лево"
            case .squareClockwise:
                return "Квадрат по часовой стрелке"
            case .squareCounterClockwise:
                return "Квадрат против часовой стрелки"
            case .circleClockwise:
                return "Круг по часовой стрелке"
            case .circleConterClockwise:
                return "Круг против часовой стрелки"
            case .slide:
                return "Горка"
            case .snake:
                return "Змейка"
            case .distance:
                return "Смотрим в даль"
            }
        }
        
        var description: String {
            switch self {
            case .relaxation:
                return "Закрываем глаза руками и пытаемся расслабиться"
            case .blinking:
                return "Закрываем и открываем глаза быстрыми движениями"
            case .upDown:
                return "Совершаем повторяющиеся движения, смотрим сначала вверх, затем вниз"
            case .leftRight:
                return "Совершаем повторяющиеся движения, смотрим сначала вправо, затем влево"
            case .diagonalHL:
                return "Совершаем повторяющиеся движения по диагонали, от левого нижнего угла к верхнему правому углу"
            case .diagonalLH:
                return "Совершаем повторяющиеся движения по диагонали, от левого верхнего угла к нижнему правому углу"
            case .squareClockwise:
                return "Рисуем квадрат по часовой стрелке"
            case .squareCounterClockwise:
                return "Рисуем квадрат против часовой стрелки"
            case .circleClockwise:
                return "Медленными движениями совершаем круговые движения глазами по часовой стрелке"
            case .circleConterClockwise:
                return  "Медленными движениями совершаем круговые движения глазами против часовой стрелки"
            case .slide:
                return "Медленными движениями сначала слева на право рисуем глазами горки, затем совершаем аналогичные движения в обратную сторону"
            case .snake:
                return "Медленными движениями сначала сверху в низ спускаемся глазами змеиными движениями, затем совершаем аналогичные движения в обратную сторону"
            case .distance:
                return "Выставляем палец перед носом на расстоянии примерно 10 см, поочередно смотрим на палец перед глазами, затем на любой дальний объект, например здание или шкаф"
            }
        }
        
        var duration: Int {
            switch self {
            case .relaxation:
                return 10
            case .blinking:
                return 3
            case .upDown:
                return 5
            case .leftRight:
                return 5
            case .diagonalHL:
                return 5
            case .diagonalLH:
                return 5
            case .squareClockwise:
                return 5
            case .squareCounterClockwise:
                return 5
            case .circleClockwise:
                return 5
            case .circleConterClockwise:
                return 5
            case .slide:
                return 5
            case .snake:
                return 5
            case .distance:
                return 5
            }
        }
    }
    
    //static let shared = DataManager()
    
    let nameOfExercises = [
        "Расслабляем глаза",
        "Быстро моргаем",
        "Вверх-вниз",
        "Влево-вправо",
        "Диагональ слева на право",
        "Диагональ справа на лево",
        "Квадрат по часовой стрелке",
        "Квадрат против часовой стрелки",
        "Круг по часовой стрелке",
        "Круг против часовой стрелки",
        "Горка",
        "Змейка",
        "Смотрим в даль",
    ]
    
    let descriptionOfExercises = [
        "Закрываем глаза руками и пытаемся расслабиться",
        "Закрываем и открываем глаза быстрыми движениями",
        "Совершаем повторяющиеся движения, смотрим сначала вверх, затем вниз",
        "Совершаем повторяющиеся движения, смотрим сначала вправо, затем влево",
        "Совершаем повторяющиеся движения по диагонали, от левого нижнего угла к верхнему правому углу",
        "Совершаем повторяющиеся движения по диагонали, от левого верхнего угла к нижнему правому углу",
        "Рисуем квадрат по часовой стрелке",
        "Рисуем квадрат против часовой стрелки",
        "Медленными движениями совершаем круговые движения глазами по часовой стрелке",
        "Медленными движениями совершаем круговые движения глазами против часовой стрелки",
        "Медленными движениями сначала слева на право рисуем глазами горки, затем совершаем аналогичные движения в обратную сторону",
        "Медленными движениями сначала сверху в низ спускаемся глазами змеиными движениями, затем совершаем аналогичные движения в обратную сторону",
        "Выставляем палец перед носом на расстоянии примерно 10 см, поочередно смотрим на палец перед глазами, затем на любой дальний объект, например здание или шкаф",
    ]
    
    let timeOfExercise = [10, 3, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10]
    
    private init() {}
    
    
}

*/
