import UIKit

// 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

struct Queue<T> { // Принцип FIFO
    
    private var something: [T] = []
    
    mutating func enqueue(_ one: T) {
        something.append(one)
    }
    
    mutating func dequeue() -> T? {
        guard something.isEmpty == false else { return nil }
        return something.removeFirst()
    }
    
    // 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
    
    subscript(_ index: Int) -> T? {
        if index > something.count - 1 { return nil }
        return something[index]
    }
}

// Проверка
var int = Queue<Int>()
int.enqueue(1)
int.enqueue(2)
int.enqueue(3)
print(int)
var someInt = int[3] // возвращает nil, так как индекса не существует


var str = Queue<String>()
str.enqueue("Привет!")
str.enqueue("Как дела?")
str.enqueue("Оно работает :)")
print(str)
str.dequeue()
str.dequeue()
str.dequeue()
str.dequeue()

// 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

// Метод сложения строк

// Комментарий: использовал самые примитивные методы, просто чтобы не запутаться

func lineAddition(elements: [String], operation: ([String]) -> String) -> String {
    return operation(elements)
}

lineAddition(elements: ["Привет!", " ", "Как дела?"]) { elements in
    var result: String = ""
    elements.forEach { element in
        result += element
    }
    return result
}

// Метод добавления строк в массив

func addToArray(elements: [String], operation: ([String]) -> [String]) -> [String] {
    return operation(elements)
}

addToArray(elements: ["Hey!", " ", "How are you doing?"]) { elements in
    var result: [String] = []
    elements.forEach { element in
        result.append(element)
    }
    return result
}





