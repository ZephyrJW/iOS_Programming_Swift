//
//  ViewController.swift
//  imagePicker
//
//  Created by Jiawei Zhao on 9/23/17.
//  Copyright © 2017 Jiawei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    var activityIndicator = UIActivityIndicatorView()
    
    @IBAction func alert(_ sender: Any) {
        
        let alert = UIAlertController(title: "Are you sure?", message: "Absolutely sure?", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in print("ok pressed")
            
//            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func spinner(_ sender: Any) {
        
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        activityIndicator.center = self.view.center
        
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        
        activityIndicator.hidesWhenStopped = true
        
        self.view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
//        UIApplication.shared.beginIgnoringInteractionEvents()
        
    }
    @IBAction func undoSpinner(_ sender: Any) {
        
        while activityIndicator.isAnimating {

            activityIndicator.stopAnimating()

        }
        
        
//        UIApplication.shared.endIgnoringInteractionEvents()
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imageView.image = image
            
        }else {
            
            print("pick failed")
            
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func importImage(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()

        imagePicker.delegate = self
        
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        imagePicker.allowsEditing = false
        
        self.present(imagePicker, animated: true, completion: nil)
        
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

