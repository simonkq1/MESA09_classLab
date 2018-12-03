//: Playground - noun: a place where people can play

import UIKit

var dict: [[String: String]] = []
//dict[0]["姓名"] = "王大明"
//dict[0]["住址"] = "台中市文心路一號"
//dict[0]["電話"] = "041111"


dict.append(["姓名": "王大明","住址": "台中市文心路1號","電話": "0411111"])
dict.append(["姓名": "李大媽","住址": "台中市文心路7號","電話": "0422222"])
dict.append(["姓名": "王小明","住址": "台中市文心路10號","電話": "0433333"])

print(dict[0])
print(dict[0]["住址"]!)
for i in dict {
    for (k,v) in i {
        if v == "李大媽" {
            print(i["住址"]!)
            break
        }
    }
}

for d in dict {
    if d["姓名"] == "李大媽" {
            print(d["住址"]!)
            break
    }
}


for i in dict {
    for (v) in i {
//        print(v)
        if v.value == "李大媽"{
            print(i["住址"]!)
            break
        }
    }
}

for i in 0..<dict.count {
    if dict[i]["姓名"]! == "李大媽" {
        print(dict[i]["住址"]!)
        break
    }
}


var i = 0
while i < dict.count {
    if dict[i]["姓名"] == "李大媽" {
        print(dict[i]["住址"]!)
        break
    }
    i += 1
}
