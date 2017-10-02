//
//  ViewController.swift
//  Table first touch
//
//  Created by Jiawei Zhao on 7/20/17.
//  Copyright © 2017 Jiawei Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var table: UITableView!
    
    @IBAction func sliderMove(_ sender: Any) {
        table.reloadData()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 50
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "Cell");
        
        let carry = Int(slider.value * 20)
        
        cell.textLabel?.text = String((indexPath.row+1) * carry)
        
        return cell;
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

