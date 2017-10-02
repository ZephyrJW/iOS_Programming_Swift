//
//  ViewController.swift
//  textDisplay
//
//  Created by Jiawei Zhao on 7/14/17.
//  Copyright © 2017 Jiawei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var guessLabel: UITextField!
    
    var target = 0
    
    @IBAction func submitAction(_ sender: Any) {
        if Int(guessLabel.text!)==target{
            resultLabel.text = "nice shot!"
        }else{
            resultLabel.text = "bad luck, try again"
        }
        target = Int(arc4random_uniform(6))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        target = Int(arc4random_uniform(6))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

