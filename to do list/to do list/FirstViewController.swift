//
//  FirstViewController.swift
//  to do list
//
//  Created by Jiawei Zhao on 7/21/17.
//  Copyright © 2017 Jiawei Zhao. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var items = [String]()
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        
        let dataObj = UserDefaults.standard.object(forKey: "items")
        
        if let data = dataObj {
            items = data as! [String]
        }
        
//        print(items.count)
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            items.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            
            UserDefaults.standard.set(items, forKey: "items")
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        var dataObj = UserDefaults.standard.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = String(items[indexPath.row])
        
        return cell
    }

}

