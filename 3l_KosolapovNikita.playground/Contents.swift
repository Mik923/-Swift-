import UIKit


//Общие для структур перечисления

enum Color {
    case red
    case green
    case blue
    case yellow
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
    
    //3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
    enum WindowPosition {
        case open
        case close
    }
        
    enum LampPosition {
        case on
        case off
    }
    
    var status: Class
    var carModel: CarModel
    var bodyType: BodyType
    var color: Color
    var engineState: EngineState
    var windowPosition: WindowPosition
    var lampPosition: LampPosition
    
    mutating func changeEngineState() {
        if engineState == .off {
            engineState = .on
        } else {
            engineState = .off
        }
    }
    
    mutating func changeWindowPosition() {
        if windowPosition == .open {
            windowPosition = .close
        } else {
            windowPosition = .open
        }
    }
    
    // 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    mutating func changeLampPosition(lampPosition: LampPosition) {
        if lampPosition == .on {
            self.lampPosition = .on
        } else {
            self.lampPosition = .off
        }
    }
    
    func description() {
        print("""
            status: \(self.status)
            carModel: \(self.carModel)
            bodyType: \(self.bodyType)
            color: \(self.color)
            engineState: \(self.engineState)
            windowPosition: \(self.windowPosition)
            lampPosition: \(self.lampPosition) \n
            """)
    }
    
    init(status: Class, carModel: CarModel, bodyType: BodyType, color: Color) {
        self.status = status
        self.carModel = carModel
        self.bodyType = bodyType
        self.color = color
        self.engineState = .off
        self.windowPosition = .close
        self.lampPosition = .off
    }
}

//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
var car1 = Auto(status: .c_class, carModel:  .BMW, bodyType: .coupe, color: .yellow)

car1.description()
car1.changeLampPosition(lampPosition: .on)
car1.changeEngineState()
car1.changeWindowPosition()

struct Truck {
    
    enum TrunkCondition {
        case full
        case empty
    }
    
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
    
    var carModel: CarModel
    var maxWeight: MaxWeight
    var typeOfTruck: TypeOfTruck
    var trunkCondition: TrunkCondition
    var engineState: EngineState
    var color: Color
    
    mutating func loadTrunk(){
        if trunkCondition == .empty {
            trunkCondition = .full
        }
    }

    mutating func unloadTrunk(){
        if trunkCondition == .full {
            trunkCondition = .empty
        }
    }
    
    mutating func changeEngineState() {
           if engineState == .off {
               engineState = .on
           } else {
               engineState = .off
           }
       }
    
    func description() {
       print("""
           carModel: \(self.carModel)
           typeOfTruck: \(self.typeOfTruck)
           maxWeight: \(self.maxWeight)
           trunkCondition: \(self.trunkCondition)
           color: \(self.color)
           engineState: \(self.engineState) \n
           """)
       }
    
    init(maxWeight: MaxWeight, typeOfTruck: TypeOfTruck, carModel: CarModel, color: Color) {
        self.carModel = carModel
        self.maxWeight = maxWeight
        self.color = color
        self.engineState = .off
        self.trunkCondition = .empty
        self.typeOfTruck = typeOfTruck
    }
}

var truck1 = Truck(maxWeight: .heavy, typeOfTruck: .Dump, carModel: .BMW, color: .green)

truck1.description()
truck1.changeEngineState()
truck1.loadTrunk()

