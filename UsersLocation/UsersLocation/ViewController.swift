//
//  ViewController.swift
//  UsersLocation
//
//  Created by Jiawei Zhao on 9/6/17.
//  Copyright © 2017 Jiawei Zhao. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print(locations[0])
        let location = locations[0]
        
        let latitude = location.coordinate.latitude
        let longtitude = location.coordinate.longitude
        let lanDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        
        let span = MKCoordinateSpan(latitudeDelta: lanDelta, longitudeDelta: lonDelta)
        
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        
        self.map.setRegion(region, animated: true)
        
//        let placemark :CLGeocoder()
//        placemark.reverseGeocodeLocation(location, completionHandler: )
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: nil) { (placemarks, error) in
            
        }
    }
}

