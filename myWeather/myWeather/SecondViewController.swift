//
//  SecondViewController.swift
//  myWeather
//
//  Created by Jiawei Zhao on 7/27/17.
//  Copyright © 2017 Jiawei Zhao. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func addAction(_ sender: Any) {
        
        let locObject = UserDefaults.standard.object(forKey: "location")
        
        var location = [String]()
        
        if let loc = locObject {
            
            location = loc as! [String]
            
            location.append(textField.text!)
            
            UserDefaults.standard.set(location, forKey: "location")
            
            textField.text = ""
            
            print("set1")
            
        }else{
            
            location.append(textField.text!)
            
            UserDefaults.standard.set(location, forKey: "location")
            
            textField.text = ""
            
            print("set2")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

