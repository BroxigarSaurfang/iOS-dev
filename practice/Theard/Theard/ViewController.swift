//
//  ViewController.swift
//  Theard
//
//  Created by ASURADA on 2018. 5. 29..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let q1 = DispatchQueue(label: "q1", qos: .userInitiated)
        let q2 = DispatchQueue(label: "q2", qos: .default)
        
        q1.sync {
            for i in 0...100 {
//                print(i)
            }
            
            for j in 101...200 {
//                print(j)
            }
            
            for k in 201...300 {
//                print(k)
            }
        }
        
        
        DispatchQueue.main.async {
            q1.async {
                for i in 0..<100 {
                    print(i)
                }
            }
            
            q2.async {
                for i in 100..<200 {
                    print(i)
                }
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

