//
//  weatherData.swift
//  WeatherApp
//
//  Created by ASURADA on 2018. 4. 23..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit

class weatherData: UIViewController {

    @IBOutlet weak var precipitationProbability: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var currentTemperature: UILabel!
    @IBOutlet weak var minTemperature: UILabel!
    @IBOutlet weak var maxTemperature: UILabel!
    @IBOutlet weak var windspeedLabel: UILabel!
    
    var precipitationProbabilityValue = 0
    var humidityValue = 0
    var currentTemperatureValue = 0
    var minTemperatureValue = 0
    var maxTemperatureValue = 0
    var windspeedValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherApi()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func weatherApi() {
        
        let weatherUrl = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData?serviceKey=CMXFPWQVrfrKQT5ahiodlGWxdc3GGJdI9yNswuxlB67Y8Aulj50Y%2F9GEDyA4JGx%2FZErsLMh%2B6wRxDUceT5yaqQ%3D%3D&base_date=20180424&base_time=0500&nx=60&ny=127&numOfRows=20&pageSize=20&pageNo=1&startPage=1&_type=json"
        
        guard let url = URL(string: weatherUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("ERROR")
            } else {
                if let content = data {
                    do {
                        let jsonWeather = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
//                        print(jsonWeather)
                        let responseData = jsonWeather["response"] as! NSDictionary
                        let bodyData = responseData["body"] as! NSDictionary
                        let itemsData = bodyData["items"] as! NSDictionary
                        let itemData = itemsData["item"] as! NSArray
                        
                        for i in 0..<itemData.count {
                            
                            let itemRow = itemData[i] as! [String:Any]
                            
                            switch itemRow["category"] as! String {
                            case "POP" :
                                self.precipitationProbabilityValue = itemRow["fcstValue"] as! Int
                            case "REH" :
                                self.humidityValue = itemRow["fcstValue"] as! Int
                            case "T3H" :
                                self.currentTemperatureValue = itemRow["fcstValue"] as! Int
                            case "TMN" :
                                self.minTemperatureValue = itemRow["fcstValue"] as! Int
                            case "TMX" :
                                self.maxTemperatureValue = itemRow["fcstValue"] as! Int
                            case "WSD" :
                                self.windspeedValue = itemRow["fcstValue"] as! Int
                            default:
                                print("Error")
                            }
                            DispatchQueue.main.async {
                                self.precipitationProbability.text = String(self.precipitationProbabilityValue)
                                self.humidityLabel.text = String(self.humidityValue)
                                self.currentTemperature.text = String(self.currentTemperatureValue)
                                self.minTemperature.text = String(self.minTemperatureValue)
                                self.maxTemperature.text = String(self.maxTemperatureValue)
                                self.windspeedLabel.text = String(self.windspeedValue)
                        }
                        
//                            print(itemRow["fcstValue"])
//                            for (key, value) in itemRow {
//                                if value == "POP" {
//
//                                    print(value)
//                                }
////                                print("\(key) : \(value)")
//                            }
                        }
//                        print(itemData)
                        
                    } catch {
                        print("ERROR")
                    }
                }
            }
        }.resume()
    }

    

}
