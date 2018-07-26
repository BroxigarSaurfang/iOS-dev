//
//  ViewController.swift
//  weatherBata
//
//  Created by ASURADA on 2018. 4. 24..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherAPi()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func weatherAPi() {
        let weatherUrl = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData?serviceKey=CMXFPWQVrfrKQT5ahiodlGWxdc3GGJdI9yNswuxlB67Y8Aulj50Y%2F9GEDyA4JGx%2FZErsLMh%2B6wRxDUceT5yaqQ%3D%3D&base_date=20180424&base_time=0500&nx=60&ny=127&numOfRows=10&pageSize=10&pageNo=1&startPage=1&_type=json"
        
        guard let url = URL(string: weatherUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("ERROR")
            } else {
                if let content = data {
                    do {
                        let jsonWeather = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        let responseData = jsonWeather["response"] as! NSDictionary
                        let bodyData = responseData["body"] as! NSDictionary
                        let itemsData = bodyData["items"] as! NSDictionary
                        let itemData = itemsData["item"] as! NSArray
                        print(itemData)
                    } catch {
                        print("ERROR")
                    }
                }
                
            }
        }.resume()
        
        
    }

}

