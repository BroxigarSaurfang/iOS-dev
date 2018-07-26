//: Playground - noun: a place where people can play

import UIKit

//Input: N = 12
//
//Output: 10 // 0, 1, 1, 2, 3, 5, 8 중 짝수인 2 + 8 = 10.

var array = [0, 1]
var index1 = 0
var index2 = 1

func inputNum(inputNum:Int) {
    
    for i in 0...array[index1] {
        for j in 0...array[index2] {
            var sumNum = 0
            if sumNum < inputNum {
                sumNum = i + j
                ind
                array.append(sumNum)
                
            }
            print(array)
        }
    }
    
}


