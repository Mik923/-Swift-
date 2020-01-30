import UIKit

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
class Car {
    
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
    
    let color: Color
    var yearOfManufacture: Int = 0
    var engineState: EngineState
    var windowPosition: WindowPosition
    var lampPosition: LampPosition
    
    init(color: Color, yearOfManufacture: Int) {
        self.color = color
        self.yearOfManufacture = yearOfManufacture
        engineState = .stop
        windowPosition = .close
        lampPosition = .off
    }
    
    func action (_ action: ActionsForCar){
        switch action {
        case .changeEngineState:
            if engineState == .stop {
                engineState = .start
                print("Двигатель включен")
            } else {
                engineState = .stop
                print("Двигатель отключен")
            }
        case .changeLampPosition:
            if lampPosition == .off {
                lampPosition = .on
                print("Фары включены")
            } else {
                lampPosition = .off
                print("Фары отключены")
            }
        case .changeWindowPosition:
            if windowPosition == .close {
                windowPosition = .open
                print("Окна открыты")
            } else {
                windowPosition = .close
                print("Окна закрыты")
            }
        }
    }
    
    func description() {
        print("""
            \n
            color: \(color)
            engineState: \(engineState)
            windowPosition: \(windowPosition)
            lampPosition: \(lampPosition)
            yearOfManufacture: \(yearOfManufacture)
            """)
    }
}

//2. Описать пару его наследников trunkCar и sportСar...
class Truсk: Car {
    
    enum truckModel {
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
    
    //3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
    
    enum ActionsForTruck {
        case loadTruck(Double)
        case unloadTruck(Double)
    }
    // 2... Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
    
    var maxWeight: Double
    var maxVolume: Double
    var currentVolume: Double = 0.0
    
    init(color: Color, yearOfManufacture: Int, maxVolume: Double, maxWeight: Double) {
        self.maxVolume = maxVolume
        self.maxWeight = maxWeight
        super.init(color: color, yearOfManufacture: yearOfManufacture)
    }
    
    //4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
    
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
    
    override func description() {
        super.description()
        print("""
            maxWeight: \(maxWeight)
            maxVolume: \(maxVolume)
            currentVolume: \(currentVolume)
            \n
            """)
    }
}

class SportCar: Car {
    
    enum sportCarModel {
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
    
    var currentMode: String
    var maxSpeed: Double
    var price: Double
    
    init(color: Color, yearOfManufacture: Int, maxSpeed: Double, price: Double) {
        self.maxSpeed = maxSpeed
        self.price = price
        self.currentMode = "Режим езды не выбран"
        super.init(color: color, yearOfManufacture: yearOfManufacture)
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
    
    override func description() {
        super.description()
        print("""
            currentMode: \(currentMode)
            maxSpeed: \(maxSpeed)
            price: \(price)
            \n
            """)
    }
}

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.

var car1 = Car(color: .blue, yearOfManufacture: 1994)
var car2 = Car(color: .red, yearOfManufacture: 2012)
car1.action(.changeEngineState)
car1.action(.changeLampPosition)
car2.action(.changeWindowPosition)

var truck1 = Truсk(color: .green, yearOfManufacture: 2015, maxVolume: 30000, maxWeight: 220)
var truck2 = Truсk(color: .red, yearOfManufacture: 2011, maxVolume: 10000, maxWeight: 120)
truck1.action(.loadTruck(20000))
truck1.action(.unloadTruck(6000))
truck1.action(.changeEngineState)
truck2.action(.changeLampPosition)
truck2.action(.changeWindowPosition)

var sportCar1 = SportCar(color: .yellow, yearOfManufacture: 2019, maxSpeed: 450, price: 60_000_000)
var sportCar2 = SportCar(color: .green, yearOfManufacture: 2018, maxSpeed: 350, price: 25_000_000)
sportCar1.currentMode
sportCar1.action(.setCityMode)
sportCar1.action(.changeEngineState)
sportCar2.action(.changeLampPosition)
sportCar2.action(.changeWindowPosition)

//6. Вывести значения свойств экземпляров в консоль.

car1.description()
truck1.description()
sportCar1.description()
