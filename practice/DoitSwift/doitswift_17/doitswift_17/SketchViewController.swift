//
//  SketchViewController.swift
//  doitswift_17
//
//  Created by ASURADA on 2018. 4. 22..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit

class SketchViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var txtLineSize: UITextField!
    
    var lastPoint:CGPoint!
    var lineSize:CGFloat = 2.0
    var lineColor = UIColor.red.cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearImageView(_ sender: UIButton) {
        imageView.image = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        lastPoint = touch.location(in: imageView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imageView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch
        let currPoint = touch.location(in: imageView)
        
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: imageView.frame.size.width, height: imageView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPoint = currPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imageView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: imageView.frame.size.width, height: imageView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            imageView.image = nil
        }
    }
    
    @IBAction func btnBlack(_ sender: UIButton) {
        lineColor = UIColor.black.cgColor
    }
    
    @IBAction func btnRed(_ sender: UIButton) {
        lineColor = UIColor.red.cgColor
    }
    
    @IBAction func btnGreen(_ sender: UIButton) {
        lineColor = UIColor.green.cgColor
    }
    
    @IBAction func btnBlue(_ sender: UIButton) {
        lineColor = UIColor.blue.cgColor
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        let size = Int(txtLineSize.text!)
//        lineSize = CGFloat(size!)
//    }
    
    @IBAction func txtEditing(_ sender: UITextField) {
        lineSize = CGFloat(Int(txtLineSize.text!)!)
        print(lineSize)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            lineSize = CGFloat(Int(txtLineSize.text!)!)
        }
        return true
    }

}
