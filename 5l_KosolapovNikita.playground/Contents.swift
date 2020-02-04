import UIKit

// 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

enum Color {
    case red
    case green
    case blue
    case yellow
}
enum EngineState {
    case start
    case stop
}
enum LampPosition {
    case on
    case off
}
enum WindowPosition {
    case open
    case close
}
enum ActionsForCar {
    case changeEngineState
    case changeWindowPosition
    case changeLampPosition
}

protocol Car {
    
    var color: Color { get }
    var yearOfManufacture: Int { get }
    var engineState: EngineState { get set }
    var windowPosition: WindowPosition { get set }
    var lampPosition: LampPosition { get set }
    
}

// 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

extension Car {
    mutating func changeEngineState() {
        if engineState == .stop {
            engineState = .start
            print("Двигатель включен")
        } else {
            engineState = .stop
            print("Двигатель отключен")
        }
    }
}

extension Car {
    mutating func changeLampPosition() {
        if lampPosition == .off {
            lampPosition = .on
            print("Фары включены")
        } else {
            lampPosition = .off
            print("Фары отключены")
        }
    }
}

extension Car {
    mutating func changeWindowPosition() {
        if windowPosition == .close {
            windowPosition = .open
            print("Окна открыты")
        } else {
            windowPosition = .close
            print("Окна закрыты")
        }
    }
}

// 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

class Truck: Car {
    
    enum TruckModel {
        case man
        case iveco
        case daf
        case scania
    }
    enum TypeOfTruck {
        case panel
        case dump
        case garbage
        case flatbed
    }
    
    enum ActionsForTruck {
        case loadTruck(Double)
        case unloadTruck(Double)
    }
    
    let color: Color
    var yearOfManufacture: Int = 0
    var engineState: EngineState
    var windowPosition: WindowPosition
    var lampPosition: LampPosition
    let truckModel: TruckModel
    let typeOfTruck: TypeOfTruck
    var maxWeight: Double = 0.0
    var maxVolume: Double = 0.0
    var currentVolume: Double = 0.0
    
    init(color: Color, yearOfManufacture: Int, maxWeight: Double, maxVolume: Double, truckModel: TruckModel, typeOfTruck: TypeOfTruck) {
        self.color = color
        self.yearOfManufacture = yearOfManufacture
        self.truckModel = truckModel
        self.typeOfTruck = typeOfTruck
        self.maxVolume = maxVolume
        self.maxWeight = maxWeight
        engineState = .stop
        windowPosition = .close
        lampPosition = .off
    }
    
    func action (_ action: ActionsForTruck){
        switch action {
        case .loadTruck(let value):
            if maxVolume < value {
                print("Ваш груз не влезает")
            } else {
                currentVolume += value
                print("Осталось места в кузове: \(maxVolume - currentVolume) л")
            }
        case .unloadTruck(let value):
            if currentVolume - value >= 0 {
                currentVolume -= value
                print("Осталось места в кузове: \(maxVolume - currentVolume) л ")
            } else {
                print("В кузове нет такого груза")
            }
        }
    }
}

// 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

extension Truck: CustomStringConvertible {
    var description: String {
        return ("""
            color: \(color)
            engineState: \(engineState)
            windowPosition: \(windowPosition)
            lampPosition: \(lampPosition)
            yearOfManufacture: \(yearOfManufacture)
            maxWeight: \(maxWeight)
            maxVolume: \(maxVolume)
            currentVolume: \(currentVolume)
            \n
            """)
    }
}

class SportCar: Car {
    
    enum SportCarModel {
        case lamborghini
        case bugatti
        case ferrari
        case pagani
    }
    enum ActionsForSportCar {
        case setTurboMode
        case setSportMode
        case setCruiseMode
        case setCityMode
    }
    
    let color: Color
    var yearOfManufacture: Int = 0
    let maxSpeed: Double
    let price: Double
    var currentMode: String
    let sportCarModel: SportCarModel
    var engineState: EngineState
    var windowPosition: WindowPosition
    var lampPosition: LampPosition
    
    init(color: Color, yearOfManufacture: Int, sportCarModel: SportCarModel, maxSpeed: Double, price: Double) {
        self.color = color
        self.yearOfManufacture = yearOfManufacture
        self.currentMode = "Режим езды не выбран"
        self.sportCarModel = sportCarModel
        self.price = price
        self.maxSpeed = maxSpeed
        engineState = .stop
        windowPosition = .close
        lampPosition = .off
    }
    
    func action (_ action: ActionsForSportCar){
        switch action {
        case .setCityMode:
            currentMode = "Выбранный режим езды: CityMode"
            print(currentMode)
        case .setCruiseMode:
            currentMode = "Выбранный режим езды: CruiseMode"
            print(currentMode)
        case .setSportMode:
            currentMode = "Выбранный режим езды: SportMode"
            print(currentMode)
        case .setTurboMode:
            currentMode = "Выбранный режим езды: TurboMode"
            print(currentMode)
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return ("""
            color: \(color)
            engineState: \(engineState)
            windowPosition: \(windowPosition)
            lampPosition: \(lampPosition)
            yearOfManufacture: \(yearOfManufacture)
            sportCarModel: \(sportCarModel)
            maxSpeed: \(maxSpeed)
            price: \(price)
            \n
            """)
    }
}

// 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

var truck1 = Truck(color: .blue, yearOfManufacture: 2015, maxWeight: 1000, maxVolume: 10000, truckModel: .daf, typeOfTruck: .dump)
var truck2 = Truck(color: .green, yearOfManufacture: 1994, maxWeight: 700, maxVolume: 8000, truckModel: .iveco, typeOfTruck: .garbage)
var sportCar1 = SportCar(color: .red, yearOfManufacture: 2019, sportCarModel: .bugatti, maxSpeed: 490, price: 40_000_000)
var sportCar2 = SportCar(color: .yellow, yearOfManufacture: 2020, sportCarModel: .lamborghini, maxSpeed: 350, price: 10_000_000)

truck1.maxVolume
truck1.action(.loadTruck(7000))
truck1.action(.unloadTruck(1500))

truck2.changeWindowPosition()
truck2.changeLampPosition()
truck2.changeEngineState()

sportCar1.changeWindowPosition()
sportCar1.changeLampPosition()
sportCar1.changeEngineState()

sportCar2.action(.setCruiseMode)
sportCar2.action(.setSportMode)
sportCar2.currentMode

// 6. Вывести сами объекты в консоль.
print(truck1)
print(sportCar1)
