//: Playground - noun: a place where people can play

import UIKit

protocol IBank {
    var bankName : String {get}
    var myMoney : Int {get}
    func inputPayment(inMoney : Int)
    func outPayment(outMoney : Int)
    func nowStatus()
}

class Bank {
    var bankName : String
    var myMoney : Int = 0
    
    init(bName:String, don:Int) {
        self.bankName = bName
        myMoney = don
    }
    
    func inputPayment(inMoney: Int) {
        self.myMoney += inMoney
        print("입금합니다")
    }
    
    func outPayment(outMoney: Int) {
        self.myMoney -= outMoney
        print("출금합니다")
    }
    
    func nowStatus() {
        print("\(self.bankName) 은행에 \(self.myMoney)원이 있습니다")
    }
}

class wooriBank : Bank, IBank {
    
}

class kookminBank : Bank, IBank {
    override func nowStatus() {
        if(super.myMoney > 5000) {
            print("우량고객 이용 감사")
        }
        super.nowStatus()
    }
    
    func exchange(newMoney:Int, changeMoney:Int) {
        
    }
}

var wBank = wooriBank(bName: "우리", don: 5000)
wBank.inputPayment(inMoney: 500)
wBank.nowStatus()

var kBnak = kookminBank(bName: "국민", don: 500)
kBnak.inputPayment(inMoney: 5000)
kBnak.nowStatus()
