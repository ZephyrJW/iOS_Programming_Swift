//
//  ViewController.swift
//  memorizedPlace
//
//  Created by Jiawei Zhao on 9/12/17.
//  Copyright © 2017 Jiawei Zhao. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
// missed mapviewDelegate
class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.  
        // action: missed ViewController
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecongnizer:)))
        lpgr.minimumPressDuration = 2
        // missed this
        map.addGestureRecognizer(lpgr)
        
        if activeIndex != -1{
            
            if places.count > activeIndex {
                
                if let name = places[activeIndex]["name"] {
                    
                    if let latitude = places[activeIndex]["lat"] {
                        
                        if let longtitude = places[activeIndex]["lon"]{
                            // check for not nil matters
                            if let lat = Double(latitude) {
                                if let lon = Double(longtitude){
                            
                                    let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                                    
                                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                    
                                    let region = MKCoordinateRegion(center: coordinate, span: span)
                                    
                                    self.map.setRegion(region, animated: true)
                                    
                                    let annotation = MKPointAnnotation()
                                    
                                    annotation.coordinate = coordinate
                                    
                                    annotation.title = name
                                    
                                    self.map.addAnnotation(annotation)
                                }
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }else {
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        }

    }
    
    func longpress(gestureRecongnizer: UIGestureRecognizer) {
        if gestureRecongnizer.state == UIGestureRecognizerState.began {
        
            print("long press")
            let touchPoint = gestureRecongnizer.location(in: self.map)
            
            let newCoordinate = self.map.convert(touchPoint, toCoordinateFrom: self.map)
            

            
            let location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            
            var name = ""
            
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                if error != nil {
                    print(error)
                }else {
                    let placemark = placemarks![0]
                    
                    if placemark.subThoroughfare != nil {
                    
                        name += placemark.subThoroughfare! + " "
                    
                    }
                    
                    if(placemark.thoroughfare != nil) {
                        
                        name += placemark.thoroughfare!
                        
                    }
                    
                    print(name+"aha?")
                    
                    if name != "" {
                        
                        
                        places.append(["name": name, "lat": String(newCoordinate.latitude), "lon": String(newCoordinate.longitude)])
                        UserDefaults.standard.set(places, forKey: "places")
                        
                        
                    } else {
                        
                        places.append(["name": "unknown place", "lat": String(newCoordinate.latitude), "lon": String(newCoordinate.longitude)])
                        UserDefaults.standard.set(places, forKey: "places")
                        
                    }
                }
            })
            
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = newCoordinate
            
            annotation.title = name
            
            self.map.addAnnotation(annotation)
            
//            places.append(["name": ])
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        
        map.setRegion(region, animated: true)
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            if(error != nil) {
                print(error)
            }else {
                let placemark = placemarks?[0]
                print(placemark?.subAdministrativeArea)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

