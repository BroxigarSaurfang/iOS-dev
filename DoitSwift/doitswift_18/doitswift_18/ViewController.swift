//
//  ViewController.swift
//  doitswift_18
//
//  Created by ASURADA on 2018. 4. 22..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewUp: UIImageView!
    @IBOutlet weak var imageViewLeft: UIImageView!
    @IBOutlet weak var imageViewRight: UIImageView!
    @IBOutlet weak var imageViewDown: UIImageView!
    
    let numberOfTouchs = 2
    
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        imgUp.append(UIImage(named: "arrow-up-green.png")!)
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        imgDown.append(UIImage(named: "arrow-down-green.png")!)
        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
        imgLeft.append(UIImage(named: "arrow-left-red")!)
        imgLeft.append(UIImage(named: "arrow-left-green")!)
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-red")!)
        imgRight.append(UIImage(named: "arrow-right-green")!)
        
        imageViewUp.image = imgUp[0]
        imageViewDown.image = imgDown[0]
        imageViewLeft.image = imgLeft[0]
        imageViewRight.image = imgRight[0]
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeUpMulti.direction = UISwipeGestureRecognizerDirection.up
        swipeUpMulti.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeUpMulti)
        
        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDownMulti.direction = UISwipeGestureRecognizerDirection.up
        swipeDownMulti.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeDownMulti)
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizerDirection.up
        swipeLeftMulti.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizerDirection.up
        swipeRightMulti.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeRightMulti)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imageViewUp.image = imgUp[0]
            imageViewDown.image = imgDown[0]
            imageViewLeft.image = imgLeft[0]
            imageViewRight.image = imgRight[0]
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.up :
                imageViewUp.image = imgUp[1]
            case UISwipeGestureRecognizerDirection.down :
                imageViewDown.image = imgDown[1]
            case UISwipeGestureRecognizerDirection.left :
                imageViewLeft.image = imgLeft[1]
            case UISwipeGestureRecognizerDirection.right :
                imageViewRight.image = imgRight[1]
            default :
                break
            }
        }
        
    }
    
    func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imageViewUp.image = imgUp[0]
            imageViewDown.image = imgDown[0]
            imageViewLeft.image = imgLeft[0]
            imageViewRight.image = imgRight[0]
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.up :
                imageViewUp.image = imgUp[2]
            case UISwipeGestureRecognizerDirection.down :
                imageViewDown.image = imgUp[2]
            case UISwipeGestureRecognizerDirection.left :
                imageViewLeft.image = imgUp[2]
            case UISwipeGestureRecognizerDirection.right :
                imageViewRight.image = imgUp[2]
            default :
                break
            }
        }
    }

}

