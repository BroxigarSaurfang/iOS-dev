//
//  CheckListForm.swift
//  TableViewBeta
//
//  Created by ASURADA on 2018. 4. 27..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit

class CheckListForm: UIViewController,UITextViewDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var txtValue: UITextView!
    
    var subject: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.txtValue.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSave(_ sender: UIBarButtonItem) {
        guard self.txtValue.text.isEmpty == false else {
            let alert = UIAlertController(title: nil, message: "내용을 입력해 주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        let data = ListData()
        data.title = self.subject
        data.content = self.txtValue.text
        data.regdate = Date()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.listInfo.append(data)
        
        self.navigationController?.popViewController(animated: true)

    }
    
    func textViewDidChange(_ textView: UITextView) {
        let content = txtValue.text as NSString
        let length = ((content.length > 15) ? 15 : content.length)
        self.subject = content.substring(with: NSRange(location: 0, length: length))
        
        self.navigationItem.title = subject
        
    }
    

}
