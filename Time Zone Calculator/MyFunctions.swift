//
//  MyFunctions.swift
//  Time Zone Calculator
//
//  Created by Akshay Kalia on 20/02/21.
//

import Foundation

func timeZoneList() -> [String]{
    
    var timeZones: [String] = []
    for timeZone in TimeZone.abbreviationDictionary {
        let timeZoneName: String = timeZone.key + ":" + timeZone.value
        timeZones.append(timeZoneName)
        
    }
return timeZones
}


