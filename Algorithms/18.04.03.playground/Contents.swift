//: Playground - noun: a place where people can play

import UIKit

class Bank {
    
    private var bankName : String = ""
    var money : Int = 0
    static var subBankName : String = ""
    
    var checkMoney : Int = 0 {
        willSet (newMoney) {
            print("입금액변경[전]")
            self.money += newMoney
        }
        didSet (oldMoney) {
            print("입금액변경[후] \(oldMoney)")
        }
    }
    
    var changeBankeName : String {
        get {
            return bankName
        }
        set (newName) {
            self.bankName = newName
        }
    }
    
    var sumDon : Int {
        get {
            return self.money
        }
        set (newMoney) {
            self.money += newMoney
        }
    }
    
    static var SubBankName : String {
        get {
            return self.subBankName
        }
        set {
            self.subBankName = newValue
        }
    }
    
    init(_ bName:String, _ mDon:Int) {
        self.bankName = bName
        self.money = mDon
    }
    
    func myMoneyPrint() {
        print("내 은행 이름은 \(self.bankName)이고 돈은 \(self.money)입니다.")
    }
    
    func inputMoney(_ mDon:Int) {
        self.money
    }
    
    static func checkMoneyPrint() {                             // 타입 메소드
        print("현재 은행은 오픈 전 입니다.")
    }
    
    class func confirmNamePrint(bName:String) {                 // class = overried 가능 , static = overried 불가능
        self.subBankName = bName
        print("\(self.subBankName) 은 오픈 전 입니다")
    }
}


var myBank = Bank("스터디 은행", 10000)
//myBank.myMoneyPrint()
//print(myBank.changeBankeName)
//myBank.changeBankeName = "studyBank"
//print(myBank.changeBankeName)
//myBank.sumDon = 5000
//print(myBank.sumDon)
//Bank.SubBankName = "24시은행"
//print(Bank.SubBankName)
myBank.checkMoney = 180
print(myBank.checkMoney)
Bank.confirmNamePrint(bName: "국민")



struct SBank {
    
    var bankName : String = ""
    var money : Int = 0
    
    init(_ bName:String, _ mDon:Int) {
        self.bankName = bName
        self.money = mDon
    }
    
    func myMoneyPrint() {
        print("내 구조체 은행 이름은 \(self.bankName)이고 돈은 \(self.money)입니다.")
    }
}

var sBank = SBank("구조체 은행", 5000)
sBank.myMoneyPrint()


