//
//  ViewController.swift
//  doitswift_16
//
//  Created by ASURADA on 2018. 4. 21..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnDrawLine(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 50, y: 50))
        context.addLine(to: CGPoint(x: 250, y: 250))
        context.strokePath()
        
        context.setLineWidth(4.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        
        context.move(to: CGPoint(x: 150, y: 200))
        context.addLine(to: CGPoint(x: 250, y: 350))
        context.addLine(to: CGPoint(x: 50, y: 350))
        context.addLine(to: CGPoint(x: 150, y: 200))
        context.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDrawRectangle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addRect(CGRect(x: 50, y: 100, width: 200, height: 200))
        context.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDrawCircle(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.addEllipse(in: CGRect(x: 50, y: 50, width: 200, height: 100))
        context.strokePath()
        
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.green.cgColor)
        
        context.addEllipse(in: CGRect(x: 50, y: 200, width: 200, height: 200))
        context.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDrawArc(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 50, y: 50))
        context.addArc(tangent1End: CGPoint(x: 200, y: 50), tangent2End: CGPoint(x: 200, y: 200), radius: CGFloat(50))
        context.addLine(to: CGPoint(x: 200, y: 200))
        
        context.move(to: CGPoint(x: 100, y: 100))
        context.addArc(tangent1End: CGPoint(x: 250, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(20))
        context.addLine(to: CGPoint(x: 100, y: 400))
        
        context.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDrawFill(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.setFillColor(UIColor.red.cgColor)
        
        let rectangle = CGRect(x: 50, y: 50, width: 200, height: 100)
        context.addRect(rectangle)
        context.fill(rectangle)
        context.strokePath()
        
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setFillColor(UIColor.blue.cgColor)
        
        let circle = CGRect(x: 50, y: 200, width: 200, height: 100)
        context.addEllipse(in: circle)
        context.fillEllipse(in: circle)
        context.strokePath()
        
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 150, y: 350))
        context.addLine(to: CGPoint(x: 250, y: 450))
        context.addLine(to: CGPoint(x: 50, y: 450))
        context.addLine(to: CGPoint(x: 150, y: 350))
        context.fillPath()
        context.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    
    @IBAction func btnAmazing(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(3.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 140, y: 200))
        context.addLine(to: CGPoint(x: 170, y: 450))
        context.addLine(to: CGPoint(x: 110, y: 450))
        context.addLine(to: CGPoint(x: 140, y: 200))
        context.fillPath()
        context.strokePath()
        
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addEllipse(in: CGRect(x: 90, y: 150, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: 90+50, y: 150, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: 90-50, y: 150, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: 90, y: 150-50, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: 90, y: 150+50, width: 100, height: 100))
        context.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    
    
    
}

