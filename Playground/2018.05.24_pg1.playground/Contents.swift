//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let a = 1...10
let b = [Int](a)
print(b)

class People: NSObject {
    private var hairColor = "black"
    func setHairColor(_ color: String) ->Bool {
        if color == "red" || color == "black" || color == "white"{
            hairColor = color
            return true
        }
        return false
    }
    func getHairColor() ->String {
        return hairColor
    }
    
func getAge() -> Int{
        return -1
    }
    
}
class Car:NSObject {
   var driver: People? = nil
    
}

class NewPeople: People {
    private var age: Int = 1
    
    func setAge(_ age: Int) ->Bool{
        if age > 0 {
            self.age = age
            return true
        }
        return false
    }
   override func getAge() -> Int{
        return age
    }
    
}


let wang = People()
let lie = People()

let swang = NewPeople()
swang.setHairColor("red")
swang.setAge(18)
print("\(swang.getAge()) : \(swang.getHairColor())")

func printAge(_ who: People){
        print(who.getAge())
}
let car1 = Car()
let car2 = Car()

car1.driver = wang
car2.driver = swang
print((car2.driver as! NewPeople).getAge())


printAge(wang)
printAge(swang)
if wang.setHairColor("white") {
    print("success setting")
}else {
    print("error")
}

