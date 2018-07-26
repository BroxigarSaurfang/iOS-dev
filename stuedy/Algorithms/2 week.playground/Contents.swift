//: Playground - noun: a place where people can play

import UIKit

var str = [10, 65, 100, 30, 95]

var result: Int = 0

for i in str {
    if i >= 40 {
        result += i
    } else {
        result += 40
    }
}

print(result / 5)


//OOXXOOXXOO
//OXOXOXOXOXOXOX
//OOOOOOOOOO
//OOOOXOOOOXOOOOX

var ox = "OOXXOXXOOO"
var oxArray = [Character]()

var index = 0
var oxResult = 0

for i in ox {
    oxArray.append(i)
}
print(oxArray)

if oxArray[index] == "O" {
    oxResult = oxResult + 1
    index += 1
} else if oxArray[index-1] == "O" && oxArray[index] == "O" {
    oxResult = oxResult + 1
    index += 1
} else if oxArray[index-1] == "X" && oxArray[index] == "O" {
    oxResult += 1
    index += 1
} else {
    oxResult += 0
    index += 1
}

print(oxResult)



var str2 = "The Curious Case of Benjamin Button"

var result2 = [String]()

for i in str2 {
    var char:String
    
    if i != " " {
        
    }else {
        
    }
}
print(result2)
