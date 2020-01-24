import UIKit

//1. Написать функцию, которая определяет, четное число или нет.

func evenness(number: Int) -> Bool {
    if number % 2 == 0 {
        return true
    } else {
        return false
    }
}

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func oddness(number: Int) -> Bool {
    if number % 3 == 0 {
        return true
    } else {
        return false
    }
}

//3. Создать возрастающий массив из 100 чисел.

var array: [Int] = Array(1...100)

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for (_, value) in array.enumerated() {
    if evenness(number: value) == true {
        array.remove(at: array.firstIndex(of: value)!)
    } else if oddness(number: value) == false {
        array.remove(at: array.firstIndex(of:value)!)
    }
}
print("\(array) \n")

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов. Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
 
func fibonacci (count: Int) -> [Decimal] {
    var fiboArray: [Decimal] = [1, 1]
    for _ in 1...count {
        let newFibo = fiboArray[fiboArray.count - 1] + fiboArray[fiboArray.count - 2]
        fiboArray.append(newFibo)
    }
    return fiboArray
}

var fiboArray = fibonacci(count: 100)
print("\(fiboArray) \n")

// 6.* Заполнить массив из 100 элементов различными простыми числами

func primeNumber(count: Int) -> [Int] {
    var intNum: [Int] = Array(2...600) // массив целых чисел
    var p: Int = 2 // первое простое число
    while p != intNum.last { // повторяем пока не проверим все p из массива
        var crossOut: [Int] = [] // массив чисел, которые нужно зачеркнуть
        for i in stride(from: 2 * p, through: 600, by: p) { // заполнение массива от 2p до n с шагом p
            crossOut.append(i)
        }
        intNum.removeAll(where: {crossOut.contains($0)} ) // зачеркиваем числа в массиве целых чисел
        p = intNum.first(where: {$0 > p})! // присваиваем первое незачеркнутое число из списка, которое больше p
    }
    return Array(intNum[0...count - 1])
}
var primeArray = primeNumber(count: 100) // заполняем массив 100 различными простыми числами
print(primeArray)
