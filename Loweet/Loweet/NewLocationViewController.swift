//
//  NewLocationViewController.swift
//  Loweet
//
//  Created by Shane Sniteman on 9/15/14.
//  Copyright (c) 2014 Shane Sniteman. All rights reserved.
//

import UIKit
import CoreLocation

class NewLocationViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var locationLabel: UILabel!
    
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    let locationManager = CLLocationManager()
    
    var currentCoordinate: CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        locationManager.distanceFilter = 50
        
        locationManager.startUpdatingLocation()
        

        // Do any additional setup after loading the view.
    }
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        for location in locations {
            
            currentCoordinate = (location as CLLocation).coordinate
            
            
        }
        
    }
    
    
    
    @IBAction func saveNewLocation(sender: AnyObject) {
        
        
        
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
