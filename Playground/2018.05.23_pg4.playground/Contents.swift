//: Playground - noun: a place where people can play

import UIKit
/*
func myPring(外部看到的 內部使用的: String){
    print(內部使用的)
    print(內部使用的)
    print(內部使用的)
}
myPring(外部看到的: "Hello")


//  名字是addTwoValuesAndPrint(x:y:)
func addTwoValuesAndPrint(x v1:Int,y v2:Int){
    print(v1 + v2)
}

//  名字是addTwoValuesAndPrint(firstValue:andSecondValue:)
func addTwoValuesWith(firstValue x:Int, andSecondValue y:Int){
    print(x + y)
}

addTwoValuesAndPrint(x: 3, y: 4)
addTwoValuesWith(firstValue: 3, andSecondValue: 4)


func addTwoValues(_ x:Int, _ y:Int){
    print(x + y)
}

addTwoValues(4, 3)

func addValues(x:Int,y:Int){
    print(x + y)
}

addValues(x: 3, y: 4)
*/
//----------------------------- -----------------------------

func addTwoValues(x: Int, y: Int)->Int {
    return x + y            //有傳回值使用return
}
let ans = addTwoValues(x: 3, y: 4)
print(ans)

func devide(x: Float, y: Float) ->Float? {
    if y == 0 {
        return nil
    }else{
        return x / y
    }
}
if let ans = devide(x: 4, y: 3) {
    print("答案為: \(ans)")
}else{
    print("運算錯誤，檢查除數是否為零")
}


func devide2(x: Float, y: Float) ->Float? {
    guard y != 0 else {
        return nil
    }
    return x / y
}

if let ans = devide2(x: 4, y: 0) {
    print("答案為: \(ans)")
}else{
    print("運算錯誤，檢查除數是否為零")
}


//----------------------------- -----------------------------

//參數預設值
func myPower(value: Decimal, power: Int = 2) ->Decimal {
    return pow(value, power)
}

let power1 = myPower(value: 2,power: 3)
let power2 = myPower(value: 2)
print(power1)
print(power2)

//----------------------------- -----------------------------

// 動態參數數量

func mySum(number arr: Int...)-> Int{
    var sum = 0
    for n in arr {
        sum += n
    }
    print(arr)
    return sum
}
//print(mySum(number: 1,2,3,4,5))
//print(mySum(number: 1,2,3,4,5,6,7,8,9,10))
mySum(number: 1,2,3,4,5)


//----------------------------- -----------------------------

var a = 10
var b = 20

// call by value => 傳值呼叫

// call by address =>   傳址呼叫

func mySwap(x: inout Int, y: inout Int){
    let tmp = x
    x = y
    y = tmp
}

print("a=\(a), b=\(b)")

mySwap(x: &a, y: &b)

print("a=\(a), b=\(b)")


func range(start x: Int, end y: Int, spacing z: Int = 1) -> [Int]{
    var arr:[Int] = []
    var num = x
    while num <= y {
        arr.append(num)
        num += z
    }
    return arr
}

print(range(start: 1, end: 10, spacing: 1))



