//
//  ViewController.swift
//  doitswift_17
//
//  Created by ASURADA on 2018. 4. 22..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtMessage: UILabel!
    @IBOutlet weak var txtTapLevel: UILabel!
    @IBOutlet weak var txtTouchLevel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        txtMessage.text = "Touches Began"
        txtTapLevel.text = String(touch.tapCount)
        txtTouchLevel.text = String(touches.count)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        txtMessage.text = "Touches Moved"
        txtTapLevel.text = String(touch.tapCount)
        txtTouchLevel.text = String(touches.count)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        txtMessage.text = "Touches Ended"
        txtTapLevel.text = String(touch.tapCount)
        txtTouchLevel.text = String(touches.count)
    }

}

