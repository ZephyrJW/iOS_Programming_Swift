//
//  ViewController.swift
//  shake and swipes
//
//  Created by Jiawei Zhao on 9/14/17.
//  Copyright © 2017 Jiawei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func swiped(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            if swipeGesture.direction == UISwipeGestureRecognizerDirection.right {
                print("swiped right")
            }else if swipeGesture.direction == UISwipeGestureRecognizerDirection.left {
                print("swiped left")
            }else {
                print("unknow gesture")
            }

        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(gesture:)))
        
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(gesture:)))
        
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            print("device shakes")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

