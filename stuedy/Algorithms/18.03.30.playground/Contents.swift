//: Playground - noun: a place where people can play

import UIKit

let str = "The Curious Case of Benjamin Button"

//var appendStr = ""
var resultStr = Array<String>()
//
//for i  in str {
//    if i != " " {
//        appendStr += String(i)
//    } else {
//        resultStr.append(appendStr)
//        appendStr = ""
//    }
//}
//
//print(resultStr)


let dataSeparatedByComma = str.components(separatedBy: " ")

for element in dataSeparatedByComma {
    resultStr.append(element)
}
print(resultStr)

let theSplits = str.split(separator: " ").map{String($0)}
print(theSplits)
