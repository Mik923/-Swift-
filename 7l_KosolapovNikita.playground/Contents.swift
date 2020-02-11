import Foundation

/*
 1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
 2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.
 */

enum PrinterErrors: Error { //  Возможные ошибки принтера
    case noPaper // нет бумаги
    case noBlackInk // нет черных чернил
    case noBlueInk // нет синих чернил
    case noRedInk // нет красных чернил
    case noYellowInk // нет желтых чернил
}

// Принтер

class Printer: CustomStringConvertible {
    
    enum PrintType: String { // Тип печати
        case color
        case blackWhite
    }
    
    var amountOfPaper = 500 // Количество бумаги в принтере
    var blackInk = 100_000 // Ресурс чернил разых цветов в страницах
    var blueInk = 30_000
    var redInk = 15_000
    var yellowInk = 20_000
    var description: String {
        return ("""
            Бумаги в принтере: \(amountOfPaper)\n
            Ресурс черных чернил: \(blackInk)\n
            Ресурс синих чернил: \(blueInk)\n
            Ресурс красныx чернил: \(redInk)\n
            Ресурс желтых чернил: \(yellowInk)\n
            """)
    }
    
    func printPages(pages: Int, color: PrintType) throws -> () {
        
        // Печатаем страницы
        
        var needPages = pages // нужное количество страниц
        
        while needPages != 0 { // Печатаем нужное количество страниц
            
            guard amountOfPaper != 0 else { throw PrinterErrors.noPaper } // не хватает бумаги
            
            if color == .blackWhite {
                guard blackInk >= pages else { throw PrinterErrors.noBlackInk } // не хватает чернил черного цвета
            }
            
            if color == .color {
                guard blueInk >= pages || color == .color else { throw PrinterErrors.noBlueInk } // не хватает чернил синего цвета
                guard redInk >= pages || color == .color else { throw PrinterErrors.noRedInk } // не хватает чернил красного цвета
                guard yellowInk >= pages || color == .color else { throw PrinterErrors.noYellowInk } // не хватает чернил желтого цвета
            }
            
            if amountOfPaper == 0 { break } // проверяем, что в принтере есть бумага
            if blueInk == 0 || redInk == 0 || yellowInk == 0 || blackInk == 0 { break } // проверяем, что есть чернила
            amountOfPaper -= 1 // напечатана одна страница
            needPages -= 1
            
            if color == .color { // цветная печать
                guard blueInk != 0 || redInk != 0 || yellowInk != 0 else { break } // проверяем, что есть чернила
                blueInk -= 1 // уменьшается ресурс картриджа
                redInk -= 1
                yellowInk -= 1
            } else if color == .blackWhite { // черно-белая печать
                guard blackInk != 0 else { break } // проверяем, что есть чернила
                blackInk -= 1
            }
        }
        print("Печать успешно завершена!")
    }
}

let printer = Printer()

try printer.printPages(pages: 400, color: .color)
printer.description

do {
    try printer.printPages(pages: 110, color: .blackWhite)
} catch PrinterErrors.noPaper {
    print("Не хватает бумаги")
} catch PrinterErrors.noBlackInk {
    print("Не хватает черных чернил")
} catch PrinterErrors.noBlueInk {
    print("Не хватает синих чернил")
} catch PrinterErrors.noRedInk {
    print("Не хватает красных чернил")
} catch PrinterErrors.noYellowInk {
    print("Не хватает желтых чернил")
} catch let error {
    print(error.localizedDescription)
}
printer.description


