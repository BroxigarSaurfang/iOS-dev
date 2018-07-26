//
//  Flogin.swift
//  MapBeta
//
//  Created by ASURADA on 2018. 6. 25..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit

class Flogin: UIViewController {

    @IBOutlet weak var blackCircle: UIImageView!
    @IBOutlet weak var yellowCicle: UIImageView!
    @IBOutlet weak var circleHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yellowCicle.layer.cornerRadius = yellowCicle.bounds.width / 2
        blackCircle.layer.cornerRadius = blackCircle.bounds.height / 2
        
        UIView.animate(withDuration: 1, animations: {
            self.yellowCicle.transform = CGAffineTransform(scaleX: 1, y: 0.2)
        }) { (success) in
            UIView.animate(withDuration: 1, animations: {
                self.yellowCicle.transform = .identity
                self.yellowCicle.frame.origin.y = 150
            }, completion: { (success) in
                UIView.animate(withDuration: 1, animations: {
                    self.yellowCicle.transform = CGAffineTransform(scaleX: 1, y: 0.2)
                }, completion: { (success) in
                    UIView.animate(withDuration: 1, animations: {
                        self.yellowCicle.transform = .identity
                        self.yellowCicle.frame.origin.y = -150
                        self.blackCircle.frame.origin.y = -1100
                    }, completion: { (success) in
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "next")
                        self.present(vc!, animated: true, completion: nil)
                        print("end")
                    })
                })
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
