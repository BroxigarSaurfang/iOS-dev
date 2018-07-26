//: Playground - noun: a place where people can play

import UIKit

// 1) 정수로 된 배열이 주어지면, 각 원소가 자신을 뺀 나머지 원소들의 곱셈이 되게 하시오. 단, 나누기 사용 금지, O(n) 시간 복잡도.
// 예) [1, 2, 3, 4, 5] - [120, 60, 40, 30, 24]

var index = 0

var indexNum = [1, 2, 3, 4, 5]

var resultIndex = Array<Int>()

for i in 0...indexNum.count - 1 {
    if i != index {
        var resultNum = 1
        resultNum *= indexNum[i]
    }
}

/* 윤년은 연도가 4의 배수이면서, 100의 배수가 아닐 때 또는 400의 배수일 때 이다.
 
 예를들어, 2012년은 4의 배수라서 윤년이지만, 1900년은 4의 배수이지만, 100의 배수이기 때문에 윤년이 아니다.
 
 하지만, 2000년은 400의 배수이기 때문에 윤년이다.
 
 1년 1월 1일부터 n년 n월까지 며칠이 지났는가
 
 n월 마지막일까지 포함 */


func leapYear(input inputYear:Int, inputMonth:Int) {
    
    let month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    var year = 0
    var day = 0
    
    for i in 1...inputYear {
        
        for j in 1...inputMonth {
            
            if i % 4 == 0 && i % 100 != 0 || i % 400 == 0 {
                
                
                
            } else {
                
            }
            
        }
        
    }
    
}

leapYear(input: 2012, inputMonth: 4)
