//
//  ViewController.swift
//  Egg Timer
//
//  Created by Jiawei Zhao on 7/17/17.
//  Copyright © 2017 Jiawei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myTimer = Timer()
    
    @IBOutlet weak var timer: UILabel!
    
    @IBAction func startAction(_ sender: Any) {
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timeElapse), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseAction(_ sender: Any) {
        myTimer.invalidate()
    }
    
    @IBAction func resetAction(_ sender: Any) {
        timer.text = String(210)
    }
    
    @IBAction func addTenSec(_ sender: Any) {
        
    }
    
    @IBAction func reduceTenSec(_ sender: Any) {
        let cur = Int(timer.text!)
        if(cur!-10>0){
            timer.text = String(cur!-10)
        }else{
            timer.text = String(0)
            myTimer.invalidate()
        }
    }
    
    func timeElapse(){
        let cur = Int(timer.text!)
        if(cur! > 0){
           timer.text = String(cur!-1)
        }else{
            myTimer.invalidate()
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

