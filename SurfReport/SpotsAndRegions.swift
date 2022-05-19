//
//  SpotsAndRegions.swift
//  SurfReport
//
//  Created by Dalton Turner on 5/19/22.
//

import Foundation

public class SurfSpot {
    var spotName: String
     
    init(spotName: String) {
        self.spotName = spotName
   }
}

public class Region {
    var name: String
    var surfSpots = [SurfSpot]()
     
    init(name: String) {
        self.name = name
    }
}
