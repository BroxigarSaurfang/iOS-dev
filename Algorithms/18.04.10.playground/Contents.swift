//: Playground - noun: a place where people can play

import UIKit

//Input: [-1, 3, -1, 5]
//
//Output: 7 // 3 + (-1) + 5
//
//
//
//Input: [-5, -3, -1]
//
//Output: -1 // -1
//
//
//
//Input: [2, 4, -2, -3, 8]
//
//Output: 9 // 2 + 4 + (-2) + (-3) + 8

var ar = [3,8,4,3,2,5,7,9]

ar.insert(ar.last!, at: 0)
ar.removeLast()
print(ar)



var ar2 = [2,4,2,5,2,4]

var indexCount = 0
var result = 0

for i in ar2 {

//    if i == ar2[indexCount] {
//        result += 1
//        indexCount += 1
//        print(ar2)
//        print(i)
//    } else {
//        indexCount += 1
//    }
}

print(result)
