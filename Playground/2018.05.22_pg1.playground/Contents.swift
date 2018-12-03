//: Playground - noun: a place where people can play

import UIKit

//------------------ Array ------------------
var i = Array(repeating: Array(repeating: 0, count: 8), count: 8)

//------------------ nill ------------------

let a = "abc"
//let n = Int(a)
var n:Int?
n = Int(a)

//if n != nil {
//    print(n! * 5)
//} else{
//    print("n 的值無法轉換")
//}

//------------------  ------------------
if n != nil {
    let nn = n!
    print(nn * 5)
    print(nn * 10)
    let y = nn * 5 + (nn - 3) * nn
}
//------------------ 等於 ------------------

if let n = n {
    print(n * 5)
    print(n * 10)
    let y = n * 5 + (n - 3) * n
}


//------------------  ------------------

let m = n ?? 0
print(m * 20)

if let n = n {          //if 等號右邊的n不為nill 將值帶入左邊的n
    print(n * 5)
} else{
    print("n 的值無法轉換")
}


