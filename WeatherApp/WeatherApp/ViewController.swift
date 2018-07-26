//
//  ViewController.swift
//  WeatherApp
//
//  Created by ASURADA on 2018. 4. 23..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func weatherAPI() {
        
        let weatherURL = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData"
        
        guard let url = URL(string: weatherURL) else { return }
        
        var parameters = [
            
        ]
        
        Alamofire.request(url, method: .get, parameters: <#T##Parameters?#>, encoding: <#T##ParameterEncoding#>, headers: <#T##HTTPHeaders?#>)
        
    }


}

