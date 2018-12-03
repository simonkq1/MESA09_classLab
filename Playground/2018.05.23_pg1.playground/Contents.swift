//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var aaa = ""

var arr = [1,3,5,2,4]
//排序---順向/逆向
arr.sorted()
arr.sorted(by:>)
//var ddd = [["trainNo": "0630", "start": "13:02", "end": "13:13"], ["trainNo": "0822", "start": "13:42", "end": "13:53"], ["trainNo": "0124", "start": "13:32", "end": "13:43"], ["trainNo": "0636", "start": "14:02", "end": "14:13"], ["trainNo": "0826", "start": "14:42", "end": "14:53"], ["trainNo": "0128", "start": "14:32", "end": "14:43"], ["trainNo": "0642", "start": "15:02", "end": "15:13"], ["trainNo": "0830", "start": "15:42", "end": "15:53"], ["trainNo": "0132", "start": "15:32", "end": "15:43"], ["trainNo": "0648", "start": "16:02", "end": "16:13"], ["trainNo": "0834", "start": "16:42", "end": "16:53"], ["trainNo": "0136", "start": "16:32", "end": "16:43"], ["trainNo": "0654", "start": "17:02", "end": "17:13"], ["trainNo": "0838", "start": "17:42", "end": "17:53"], ["trainNo": "0140", "start": "17:32", "end": "17:43"], ["trainNo": "0660", "start": "18:02", "end": "18:13"], ["trainNo": "0242", "start": "17:57", "end": "18:08"], ["trainNo": "0842", "start": "18:42", "end": "18:53"], ["trainNo": "0664", "start": "18:36", "end": "18:48"], ["trainNo": "0144", "start": "18:32", "end": "18:43"], ["trainNo": "0666", "start": "19:02", "end": "19:13"], ["trainNo": "0846", "start": "19:42", "end": "19:53"], ["trainNo": "0670", "start": "19:36", "end": "19:48"], ["trainNo": "0148", "start": "19:32", "end": "19:43"], ["trainNo": "0672", "start": "20:02", "end": "20:13"], ["trainNo": "0850", "start": "20:42", "end": "20:53"], ["trainNo": "0676", "start": "20:36", "end": "20:48"], ["trainNo": "0152", "start": "20:32", "end": "20:43"], ["trainNo": "0678", "start": "21:02", "end": "21:13"], ["trainNo": "0854", "start": "21:42", "end": "21:53"], ["trainNo": "0156", "start": "21:32", "end": "21:43"], ["trainNo": "0684", "start": "22:02", "end": "22:13"], ["trainNo": "0858", "start": "22:42", "end": "22:53"], ["trainNo": "0160", "start": "22:32", "end": "22:43"], ["trainNo": "0690", "start": "23:07", "end": "23:18"], ["trainNo": "0862", "start": "23:47", "end": "23:58"], ["trainNo": "1652", "start": "16:36", "end": "16:48"], ["trainNo": "1238", "start": "16:57", "end": "17:08"], ["trainNo": "1658", "start": "17:36", "end": "17:48"], ["trainNo": "1546", "start": "17:16", "end": "17:28"], ["trainNo": "1550", "start": "18:16", "end": "18:28"], ["trainNo": "1246", "start": "18:57", "end": "19:08"], ["trainNo": "1250", "start": "19:57", "end": "20:08"], ["trainNo": "1254", "start": "20:57", "end": "21:08"], ["trainNo": "1682", "start": "21:36", "end": "21:48"], ["trainNo": "1688", "start": "22:36", "end": "22:48"], ["trainNo": "1264", "start": "23:21", "end": "23:33"], ["trainNo": "1640", "start": "14:36", "end": "14:48"], ["trainNo": "1646", "start": "15:36", "end": "15:48"], ["trainNo": "1234", "start": "15:57", "end": "16:08"], ["trainNo": "1542", "start": "16:16", "end": "16:28"], ["trainNo": "1320", "start": "17:47", "end": "17:58"], ["trainNo": "1554", "start": "19:16", "end": "19:28"], ["trainNo": "1558", "start": "20:16", "end": "20:28"], ["trainNo": "1562", "start": "21:16", "end": "21:28"], ["trainNo": "1258", "start": "21:57", "end": "22:08"], ["trainNo": "1330", "start": "22:47", "end": "22:58"], ["trainNo": "1566", "start": "22:16", "end": "22:28"], ["trainNo": "1570", "start": "23:01", "end": "23:13"]]
//
//let ccc = ddd.sorted { (d1, d2) -> Bool in
//    return d1["start"]! < d2["start"]!
//}
//print(ccc)

//反置
let x = arr.reversed()
x.forEach{(e) in
    print (e)
}
arr.index(of: )

//檢查特定元素

arr.contains(5)
arr.contains(10)

//arr[1] , [3] 對調

arr.swapAt(1, 3)

arr.first   //arr[0]
arr.last    //arr[arr.count -1]

arr.count
aaa.lowercased()
//  陣列越界
//arr[10]
arr.removeFirst(2)

/*
 //---------------------------------------字串---------------------------------------
 str.lowercased()  //小寫
 str.uppercased()  //大寫
 //將字元轉化為陣列
 let arr = Array(str)
 arr[2]
 
 //取出字元
 str[str.startIndex]
 str[.init(encodedOffset: 7)]
 str[str.index(str.startIndex, offsetBy: 7)]
 
 //取出子字串
 let begin = str.index(of: "p")
 let end = str.index(begin!, offsetBy: 4)
 let newstr = String(str[begin!..<end])
 print(newstr)
 
 //是否包含關鍵字


 if str.contains("play"){
 print("有包含play")
 }
 
 //檢查字串開頭, 結尾
 if str.lowercased().hasPrefix("he"){
 print("字串為He開頭")
 }
 
 if str.lowercased().hasSuffix("ound"){
 print("字串為ound結尾")
 }
 
 //開頭/結尾取n個字
 
 str.prefix(5)
 str.suffix(6)
 
 //csv字串切割
 
 let s = "Simon,Da Lin Road,0425676698"
 let list = s.split(separator: ",")
 print(list[1])
 
 //取代
 let tmp = str.replacingOccurrences(of: "play", with: "aaa")
 
 //頭尾去空白
 let spaceString = " simon   "
 print(spaceString.trimmingCharacters(in: .whitespacesAndNewlines))
 
 
 */

//---------------------------------------迴圈---------------------------------------
/*
 for i in 0...10 {
 print(i)
 }
 
 print("-------------------------------------")
 
 for i in 0..<10 where i % 2 == 0{
 print(i)
 }
 print("-------------------------------------")
 
 for i in (0..<10).reversed() where i % 2 == 0 {  //從9到0
 print(i)
 }
 print("-------------------------------------")
 
 for i in stride(from: 0, to: 10, by: 2) {        //to 不包含 10
 print(i)
 }
 print("-------------------------------------")
 
 for i in stride(from: 0, through: 10 , by: 2){   //through 包含 10
 print(i)
 }
 print("-------------------------------------")
 
 for i in stride(from: 10, through: 0, by: -2) {  //遞減
 print(i)
 }
 */


