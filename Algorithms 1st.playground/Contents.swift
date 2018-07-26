//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"




var inputTextArray:Set = ["hesitate","yours","wont","more","wait","no","but","it","im","i","cannot"]

//var textCharater = inputText?.characters

//var textCount = textCharater?.count

var outputText:[String] = []

func inputTextAlgorithms() {
    
}

var sortedText = inputTextArray.sorted { (s1, s2) -> Bool in

    s1.characters.count > s2.characters.count

}

print(sortedText)

var appendText:[Any] = sortedText.reversed()

print("이거슨 답! \(appendText)")

let tuple = "ab2v9bc13j5jf4jv21"

//var dropTuple = tuple.characters.drop { (cha) -> Bool in
//
//}

func input() {

    
}

var tupleArray:[Any] = []

print("아 \(tupleArray)")

var x = 29
x = x + 1
x += 1
//x++

if x <= 30 {
    print("양호")
}else if x <= 50 {
    print("aa")
}

let forList = [
    "a" : "A",
    "b" : "B",
    "c" : "C",
    "d" : "D",
    "e" : "E"]

for (small, large) in forList {
    let sortSmall = small.sorted()
    let sortLarge = large.sorted()
    print("small alphabat \(sortSmall) large alphabat \(sortLarge)")
}

//func isPalindrome(word: String) -> Bool {
//
//}

class Car {
    
    var price: Double
    var insured: Bool
    var owner: String
    
    init(newPrice: Double, newInsured:Bool, newOwner:String) {
        price = newPrice
        insured = newInsured
        owner = newOwner
    }
    
    func registerInsurance(insurance:Bool) {
        
        if insurance == false {
            self.insured = true
            print("등록되었습니다.")
        } else {
            print("이미 가입된 차량입니다.")
        }
    }
        
    func addOption(amount:Double) {
    
        if amount > 0 {
            self.price += amount
        } else {
            print("0보다 커야 합니다")
        }
    }
    
    func discription() {
        
     print("차량 주인은 \(self.owner)입니다. 가격은 \(self.price)입니다.")
        
    }
}

"a" > "b"

class Exercise {
    func ageCategory(for age: Int) {
        //이 줄 밑으로만 코드를 쓰세요. 아래 if문을 고쳐주세요
        if age < 15 {
            print("Children")
        }else if age < 25 {
            print("Youth")
        }else if age < 65 {
            print("Adults")
        }else {
            print("Seniors")
        }
        //이 줄 위로만 코드를 쓰세요.
    }
}


