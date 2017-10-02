//
//  SecondViewController.swift
//  to do list
//
//  Created by Jiawei Zhao on 7/21/17.
//  Copyright © 2017 Jiawei Zhao. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    var itemArr = [String]()
    
    @IBAction func addAction(_ sender: Any) {
        let itemObj = textField.text
        
        if let item = itemObj {
            if item != "" {
                
                if let items = UserDefaults.standard.object(forKey: "items"){
                    
                    itemArr = items as! [String]
                    
                    itemArr.append(item)
                    
                    UserDefaults.standard.set(itemArr, forKey: "items")
                    
                }else{
                    
                    itemArr.append(item)
                    
                    UserDefaults.standard.set(itemArr, forKey: "items")
                    
                }
          
            }
        }
        
//        for s in itemArr{
//            print(s)
//        }
        
        textField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        let itemObj = textField.text
        
        if let item = itemObj {
            if item != "" {
                
                if let items = UserDefaults.standard.object(forKey: "items"){
                    
                    itemArr = items as! [String]
                    
                    itemArr.append(item)
                    
                    UserDefaults.standard.set(itemArr, forKey: "items")
                    
                }else{
                    
                    itemArr.append(item)
                    
                    UserDefaults.standard.set(itemArr, forKey: "items")
                    
                }
                
            }
        }
        
        textField.text = ""
        
        return true
    }
    
}

