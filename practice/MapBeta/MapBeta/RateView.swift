//
//  RateView.swift
//  MapBeta
//
//  Created by ASURADA on 2018. 6. 9..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit

class RateView: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var t1: UITextField!
    @IBOutlet weak var t2: UITextField!
    @IBOutlet weak var t3: UITextField!
    
    private let MAX_LENGTH = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: NSNotification.Name.UITextFieldTextDidChange, object: t1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
        let text = t2.text?.utf8
        print(text!.count)
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 10
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        let current = newString as String
        print(current.utf8.count)
        print(t1.text?.count)
        print(t2.text?.count)
//        switch maxLength {
//        case t1.text?.count:
//            t2.becomeFirstResponder()
//        case t2.text?.count:
//            t3.becomeFirstResponder()
//        default:
//            print("error")
//        }
        if maxLength <= (t1.text?.count)! {
            t2.becomeFirstResponder()
        } else if maxLength <= (t2.text?.count)! {
            t3.becomeFirstResponder()
        } else if maxLength <= (t3.text?.count)! {
            t3.resignFirstResponder()
        }
        return current.utf8.count <= maxLength
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        guard let text = textField.text else {return false}
//
//        // 중간에 추가되는 텍스트 막기
//
//        // NSString(format: "%s", text).length
//        if text.characters.count >= MAX_LENGTH && range.length == 0 && range.location < MAX_LENGTH {
//
//            return false
//        }
//
//        return true
//
//    }
//
//
//    @objc private func textDidChange(_ notification: Notification) {
//
//        if let textField = notification.object as? UITextField {
//
//            if let text = textField.text {
//
//                // 초과되는 텍스트 제거
//
////                 NSString(format: "%s", text).length
//                if text.characters.count >= MAX_LENGTH {
//
//                    let index = text.index(text.startIndex, offsetBy: MAX_LENGTH)
//
//                    let newString = text.substring(to: index)
//
//                    textField.text = newString
//
//                }
//
//            }
//
//        }
//
//    }
    


}
