//
//  ViewController.swift
//  download from web
//
//  Created by Jiawei Zhao on 7/21/17.
//  Copyright © 2017 Jiawei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "http://www.weather-forecast.com/locations/London/forecasts/latest")!
        
        let request = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            if(error != nil){
                print(error as Any)
            }else{
                if let unwrappedData = data{
                    let data = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    
                    print(data)
                }
                
            }
            
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

