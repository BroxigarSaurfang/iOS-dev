//: Playground - noun: a place where people can play

import UIKit

func times(x:Int, y:Int) -> Int {
    return (x*y)
}

func boo(age:Int) -> String {
    return "\(age)"
}

let fn : (Int) -> String = boo
//let fn : (Int) -> String = boo(age:)
fn(7)
print(fn(7))


var setNum : Set = Set<Int>()

func inputNum(to: Int) {
    
    var num = Array<String>()

    var stringNum : String = ""
    
    for i in 19...to {
        stringNum = String(i)
        
        var charNum = stringNum.map({ (char) -> T in
            stringNum + Int(char)
        })
        
        print(stringNum)
        print(charNum)
        
    }
}

inputNum(to: 24)
