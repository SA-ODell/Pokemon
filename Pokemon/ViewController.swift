//
//  ViewController.swift
//  Pokemon
//
//  Created by Steve @work on 5/1/17.
//  Copyright © 2017 Mile High Devs. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var updateCount = 0
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            print("Ready to Go!")
            mapView.showsUserLocation = true
            manager.startUpdatingLocation()
        }   else {
            manager.requestWhenInUseAuthorization()

        }
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if updateCount < 1 {
        let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 5000, 5000)
        mapView.setRegion(region, animated: true)
        updateCount += 1
        } else {
            manager.stopUpdatingLocation()
        }
    }
    @IBAction func centerTapped(_ sender: Any) {
        let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 5000, 5000)
        mapView.setRegion(region, animated: true)
    }
    
// add drop pin
//    func action(gestureRecognizer:UIGestureRecognizer){
//        let touchPoint = gestureRecognizer.location(in: mapView)
//        let newCoordinates = mapView.convert(touchPoint, toCoordinateFrom: mapView)
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = newCoordinates
//        mapView.addAnnotation(annotation)
//    }

}

