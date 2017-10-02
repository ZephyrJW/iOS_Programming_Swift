//
//  FirstViewController.swift
//  myWeather
//
//  Created by Jiawei Zhao on 7/27/17.
//  Copyright © 2017 Jiawei Zhao. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myView: UITableView!
    
    var location = [String]()
    var weather = [String]()
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("here!")
        
        weather = []
        
        let locObject = UserDefaults.standard.object(forKey: "location")
        
        if let loc=locObject {
            location = loc as! [String]
            
            for s in location {
                var info = ""
                
                let url = URL(string: "http://www.weather-forecast.com/locations/"+s+"/forecasts/latest")!
                
                let request = NSMutableURLRequest(url: url)
                
                let task = URLSession.shared.dataTask(with: request as URLRequest){
                    data, response, error in
                    
                    if error != nil {
                        print(error)
                    }else{
                        if let unwrappedData = data {
                            
                            let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                            
                            var separator = "3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
                            
                            let content = dataString?.components(separatedBy: separator)
                            
                            if let contentArray = content {
                                if contentArray.count > 1 {
                                    let res = contentArray[1]
                                    
                                    separator = ","
                                    
                                    info = res.components(separatedBy: separator)[0]
                                    
//                                    print(info+" is what")
                                }
                            }
                            
                        }
                        
                    }
                    
                    DispatchQueue.main.async(execute: {
                        
                        self.weather.append(self.location[self.weather.count]+": "+info)
                        
                        print(self.weather.count)
                        
                    })
                    
//                    self.weather.append(self.location[self.weather.count]+": "+info)
//                    print(self.weather.count)
                }
                
                task.resume()
            }
            
        }
        
        for loc in location{
            print(loc)
        }
        
        print(String(location.count) + " " + String(weather.count))
        
        for wea in weather{
            print(wea)
        }
        
//        while(weather.count != location.count){
//            infinite loop
//        }
        
        myView.reloadData()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return weather.count;
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        print("reload data")
        
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = weather[indexPath.row]
        
        return cell
    }
    


}

