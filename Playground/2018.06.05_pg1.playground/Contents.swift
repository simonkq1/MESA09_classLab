//: Playground - noun: a place where people can play

import UIKit


/*
var str = ".ac .ad .ae .af .ag .ai .al .am .an .ao .aq .ar .as .at .au .aw .az .ba .bb .bd .be .bf .bg .bh .bi .bj .bm .bn .bo .br .bs .bt .bv .bw .by .bz .ca .cc .cd .cf .cg .ch .ci .ck .cl .cm .cn .co .cr .cu .cv .cx .cy .cz .de .dj .dk .dm .do .dz .ec .ee .eg .er .es .et .eu .fi .fj .fk .fm .fo .fr .ga .gd .ge .gf .gg .gh .gi .gl .gm .gn .gp .gq .gr .gs .gt .gu .gw .gy .hk .hm .hn .hr .ht .hu .id .ie .il .im .in .io .iq .ir .is .it .je .jm .jo .jp .ke .kg .kh .ki .km .kn .kr .kw .ky .kz .la .lb .lc .li .lk .lr .ls .lt .lu .lv .ly .ma .mc .md .me .mg .mh .mk .ml .mm .mn .mo .mp .mq .mr .ms .mt .mu .mv .mw .mx .my .mz .na .nc .ne .nf .ng .ni .nl .no .np .nr .nu .nz .om .pa .pe .pf .pg .ph .pk .pl .pm .pn .pr .ps .pt .pw .py .qa .re .ro .ru .rw .sa .sb .sc .sd .se .sg .sh .si .sk .sl .sm .sn .so .sr .st .sv .sy .sz .tc .td .tf .tg .th .tj .tk .tl .tm .tn .to .tr .tt .tv .tw .tz .ua .ug .uk .us .uy .uz .va .vc .ve .vg .vi .vn .vu .wf .ws .ye .yt .yu .za .zm .zw"
var arr = str.split(separator: ".")
var lottery:[Int] = []
var country:[String] = []
for i in arr {
    country.append(".\(i.trimmingCharacters(in: .whitespacesAndNewlines))")
}
//print(country)
var num = [1,2,3,4,5,6,7,8,9,10]
var a: Int = 10
//num.last
func lotteryFunc(){
    for _ in 0..<a{
        let rand = Int(arc4random_uniform(UInt32(num.count)))
        lottery.append(num[rand])
        num.swapAt(num.count - 1, rand)
        num.removeLast()
    }
    print(lottery)
}


lotteryFunc()
//print(arr[rand])
 
 */

//let a = 10.0
//a.squareRoot()
////tan(0.5)
//atan(0.5)
//
//var arcsinus = asin(90 * CGFloat.pi / 180)
//var arcosinus = acos(90 * CGFloat.pi / 180)
//var arctangent = 180 - (atan(1) * 180 / CGFloat.pi)

