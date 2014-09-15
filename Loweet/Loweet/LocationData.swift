//
//  LocationData.swift
//  Loweet
//
//  Created by Shane Sniteman on 9/15/14.
//  Copyright (c) 2014 Shane Sniteman. All rights reserved.
//

import UIKit


/// will hold our tweet locations in our array
/// if we add or remove items for the array, we want to post the notification from here


let _locationData: LocationData = {
    
    LocationData()
    
}()


class LocationData: NSObject {
    
    var locations: [[String:AnyObject]] = []
    
    
    class func mainData() -> LocationData {
     
        
        return _locationData
    }
    
    func addLocation(location: [String:AnyObject]) {
        
        self.locations += [location]
        
        let nc = NSNotificationCenter.defaultCenter()
        
        nc.postNotificationName("tweetLocationsUpdated", object: nil, userInfo: nil)
        
    }
    
    
}
