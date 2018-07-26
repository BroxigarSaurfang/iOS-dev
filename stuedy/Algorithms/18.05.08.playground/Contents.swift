//: Playground - noun: a place where people can play

import UIKit

//Input: 1
//
//Output: ["()"]
//
//Input: 2
//
//Output: ["(())", "()()"]
//
//Input: 3
//
//Output: ["((()))", "(()())", "()(())", "(())()", "()()()"]

var bracketArray = [String]()

func blank(input: Int) {
    var fBracket = ""
    var lBracket = ""
    var cBracket = "()"
    
    for i  in 0..<input {
        fBracket += "("
        lBracket += "()"
        for j in 0..<input-1 {
            
        }
    }
    
    for i in 0..<input {
        fBracket += ")"
    }
    bracketArray.append(fBracket)
    bracketArray.append(lBracket)
}

blank(input: 3)
print(bracketArray)

