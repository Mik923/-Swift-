import UIKit

//Общие для структур (автомобиль и грузовик) перечисления

enum Color {
    case red
    case green
    case blue
    case yellow
    case purple
    case orange
}

enum EngineState {
    case on
    case off
}

enum CarModel {
    case BMW
    case Mercedes
    case Volvo
    case Nissan
}

enum WindowPosition {
    case open
    case close
}

enum LampPosition {
    case on
    case off
}


//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

enum Actions {
    case changeEngineState
    case changeWindowPosition
    case changeLampPosition
    case loadTrunk(Double)
    case unloadTrunk(Double)
}


//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
struct Auto {
    
    //2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
    enum Class {
        case a_class
        case b_class
        case c_class
        case d_class
    }
    enum BodyType {
        case coupe
        case hatchBack
        case sedan
        case cabriolet
    }
    
    let status: Class
    let carModel: CarModel
    let bodyType: BodyType
    let color: Color
    var trunkVolume: Double
    var trunkCondition: Double
    var yearOfManufacture: Int
    var engineState: EngineState
    var windowPosition: WindowPosition
    var lampPosition: LampPosition
    
    init(status: Class, carModel: CarModel, bodyType: BodyType, color: Color, yearOfManufacture: Int) {
        self.status = status
        self.carModel = carModel
        self.bodyType = bodyType
        self.color = color
        self.yearOfManufacture = yearOfManufacture
        trunkVolume = 500
        engineState = .off
        windowPosition = .close
        lampPosition = .off
        trunkCondition = 0
    }
    
    // 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    mutating func action (_ action: Actions){
        switch action {
        case .changeEngineState:
            if engineState == .off {
                engineState = .on
                print("Двигатель включен")
            } else {
                engineState = .off
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
        case .loadTrunk(let value):
            if trunkVolume < value {
                print("Ваш багаж не влезает")
            } else {
                trunkCondition += value
                print("Осталось места в багажнике: \(trunkVolume - trunkCondition) л")
            }
        case .unloadTrunk(let value):
            if trunkCondition - value >= 0 {
                trunkCondition -= value
                print("Осталось места в багажнике: \(trunkVolume - trunkCondition) л ")
            } else {
                print("Вы не можете выгрузить больше, чем есть")
            }
        }
    }
    // 6. Вывести значения свойств экземпляров в консоль.
    func description() {
        print("""
            \n
            status: \(status)
            carModel: \(carModel)
            bodyType: \(bodyType)
            color: \(color)
            engineState: \(engineState)
            windowPosition: \(windowPosition)
            lampPosition: \(lampPosition)
            trunkVolume: \(trunkVolume)
            trunkCondition: \(trunkCondition)
            yearOfManufacture: \(yearOfManufacture)\n
            """)
    }
}

//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
var car = Auto(status: .c_class, carModel:  .BMW, bodyType: .coupe, color: .yellow, yearOfManufacture: 2015)

car.description()
car.action(.changeEngineState)
car.action(.changeLampPosition)
car.action(.changeWindowPosition)
car.action(.loadTrunk(400))
car.action(.unloadTrunk(300))


struct Truck {
    
    enum TypeOfTruck {
        case Panel
        case Dump
        case Garbage
        case Flatbed
        case Heavy
    }
    
    enum MaxWeight {
        case heavy
        case medium
        case light
    }
    
    let typeOfTruck: TypeOfTruck
    let maxWeight: MaxWeight
    let carModel: CarModel
    let color: Color
    var trunkVolume: Double
    var trunkCondition: Double
    var yearOfManufacture: Int
    var engineState: EngineState
    var windowPosition: WindowPosition
    var lampPosition: LampPosition
    
    init(maxWeight: MaxWeight, typeOfTruck: TypeOfTruck, carModel: CarModel, color: Color, yearOfManufacture: Int) {
        self.maxWeight = maxWeight
        self.typeOfTruck = typeOfTruck
        self.carModel = carModel
        self.color = color
        self.yearOfManufacture = yearOfManufacture
        trunkVolume = 100
        engineState = .off
        windowPosition = .close
        lampPosition = .off
        trunkCondition = 0
    }
    
    mutating func action (_ action: Actions){
        switch action {
        case .changeEngineState:
            if engineState == .off {
                engineState = .on
                print("Двигатель включен")
            } else {
                engineState = .off
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
        case .loadTrunk(let value):
            if trunkVolume < value {
                print("Ваш багаж не влезает")
            } else {
                trunkCondition += value
                print("Осталось места в багажнике: \(trunkVolume - trunkCondition) м^3")
            }
        case .unloadTrunk(let value):
            if trunkCondition - value >= 0 {
                trunkCondition -= value
                print("Осталось места в багажнике: \(trunkVolume - trunkCondition) м^3")
            } else {
                print("Вы не можете выгрузить больше, чем есть")
            }
        }
    }
    
    func description() {
        print("""
            \n
            carModel: \(carModel)
            typeOfTruck: \(typeOfTruck)
            maxWeight: \(maxWeight)
            color: \(color)
            engineState: \(engineState)
            windowPosition: \(windowPosition)
            lampPosition: \(lampPosition)
            trunkVolume: \(trunkVolume)
            trunkCondition: \(trunkCondition)
            yearOfManufacture: \(yearOfManufacture)\n
            """)
    }
}

var truck = Truck(maxWeight: .heavy, typeOfTruck: .Dump, carModel: .BMW, color: .green, yearOfManufacture: 2005)

truck.description()
truck.action(.changeEngineState)
truck.action(.changeLampPosition)
truck.action(.changeWindowPosition)
truck.action(.loadTrunk(70))
truck.action(.unloadTrunk(30))



