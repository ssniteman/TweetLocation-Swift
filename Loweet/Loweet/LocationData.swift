//
//  LocationData.swift
//  Loweet
//
//  Created by Shane Sniteman on 9/15/14.
//  Copyright (c) 2014 Shane Sniteman. All rights reserved.
//

import UIKit
import SwifteriOS
import CoreLocation


/// will hold our tweet locations in our array
/// if we add or remove items for the array, we want to post the notification from here

// Add STTwitter SWIFTER framework to Xcode project (found on GitHub)
// Add touch to map to drop a pin and show a "new tweet location" form like the plus button
// Make pins draggable and change location for item when dropped
// Make a test Twitter account and sign in on your device
// Run some test tweets using STTwitter in your app



let _locationData: LocationData = {
    
    LocationData()
    
}()


class LocationData: NSObject, CLLocationManagerDelegate {
    
    var tweetLocations: [[String:AnyObject]] = []
    
    
    class func mainData() -> LocationData {
     
        
        
        return _locationData
    }
    
    func addLocation(location: [String:AnyObject]) {
        
        self.tweetLocations += [location]
        
        let nc = NSNotificationCenter.defaultCenter()
        
        nc.postNotificationName("tweetLocationUpdated", object: nil, userInfo: nil)
        
    }
    
    /// Location
    
    /// setting up location manager to listen for location
    
    
    let locationManager = CLLocationManager()
    
    override init() {
        
        super.init()
        
        self.locationManager.delegate = self
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        // new location everytime we move
        
        for location in locations as [CLLocation] {
            
            for tweetLocation in self.tweetLocations {
            
                var tweetLocationPoint = CLLocation(latitude: tweetLocation["latitude"] as CLLocationDegrees,
                    longitude: tweetLocation["longitude"] as CLLocationDegrees)
                
                location.distanceFromLocation()
                
                
            }
        
        }
        
    }
    
    // custom method we created
    
    func checkDistanceBetweenLocations (location1: CLLocation, location2: CLLocation) -> Double {
        
        
        
        let DEG_TO_RAD = 0.017453292519943295769236907684886
        let EARTH_RADIUS_IN_METERS = 6372797.560856
        
        let latitudeArc  = (location1.coordinate.latitude - location2.coordinate.latitude) * DEG_TO_RAD
        let longitudeArc = (location1.coordinate.longitude - location2.coordinate.longitude) * DEG_TO_RAD
        
        var latitudeH = sin(latitudeArc * 0.5)
        
        latitudeH *= latitudeH;
        
        var longitudeH = sin(longitudeArc * 0.5)
        
        longitudeH *= longitudeH
        
        let tmp = cos(location1.coordinate.latitude * DEG_TO_RAD) * cos(location2.coordinate.latitude * DEG_TO_RAD)
        
        return EARTH_RADIUS_IN_METERS * 2.0 * asin( sqrt( latitudeH + tmp * longitudeH ) )
        
        
    }

}
