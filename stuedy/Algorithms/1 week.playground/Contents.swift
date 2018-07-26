//: Playground - noun: a place where people can play

let number = [7, 12, 1, 2, 9, 38, 44, 512, 6, 393, 0, 20, 78, 76]
var forNum = [String]()
var sortNum = ""
for i in number {
    forNum.append(String(i))
}
print(forNum)

var sortedNum = forNum.sorted { (s1, s2) -> Bool in
    s1 > s2
}

print(sortedNum)

for i in sortedNum {
    sortNum += i
}

print(sortNum)

//print(sortedNum)

//if sortNum.isEmpty {
//    sortNum.append(number[0])
//    print(sortNum)
//} else {
//
//}

