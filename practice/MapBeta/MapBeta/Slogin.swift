//
//  Slogin.swift
//  MapBeta
//
//  Created by ASURADA on 2018. 6. 25..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit

class Slogin: UIViewController {

    @IBOutlet weak var yellowCircle: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yellowCircle.layer.cornerRadius = yellowCircle.bounds.width / 2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
