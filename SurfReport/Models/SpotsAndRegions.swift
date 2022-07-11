//
//  SpotsAndRegions.swift
//  SurfReport
//
//  Created by Dalton Turner on 5/19/22.
//

import Foundation
import MapKit

public struct SurfSpot {
    var spotName: String
    var location: CLLocation
}

public struct Region {
    var name: String
    var surfSpots = [SurfSpot]()
}

#if DEBUG
extension SurfSpot {
    static var californiaSouthSampleData = [
        SurfSpot(spotName: "Grandview",
                 location: CLLocation(latitude: 33.076475, longitude: -117.310550)
                ),
        SurfSpot(spotName: "Swamis",
                 location: CLLocation(latitude: 33.034147, longitude: -117.292539)
                ),
        SurfSpot(spotName: "Ocean Beach",
                 location: CLLocation(latitude: 32.755602, longitude: -117.253075)
                ),
        SurfSpot(spotName: "Sunset Cliffs",
                 location: CLLocation(latitude: 32.719109, longitude: -117.258046)
                ),
        SurfSpot(spotName: "Point Loma",
                 location: CLLocation(latitude: 32.668589, longitude: -117.248338)
                ),
    ]

    static var californiaNorthSampleData = [
        SurfSpot(spotName: "Steamer Lane",
                 location: CLLocation(latitude: 36.951630, longitude: -122.025644)
                ),
        SurfSpot(spotName: "Three Mile",
                 location: CLLocation(latitude: 36.961086, longitude: -122.113302)
                ),
        SurfSpot(spotName: "Pacifica",
                 location: CLLocation(latitude: 37.598580, longitude: -122.504155)
                ),
        SurfSpot(spotName: "Montara State Beach",
                 location: CLLocation(latitude: 37.546648, longitude: -122.516429)
                ),
        SurfSpot(spotName: "Mavericks",
                 location: CLLocation(latitude: 37.491619, longitude: -122.499176)
                ),
    ]
}

extension Region {
    static var californiaNorth = Region(name: "California - North", surfSpots: SurfSpot.californiaNorthSampleData)
    static var californiaSouth = Region(name: "California - South", surfSpots: SurfSpot.californiaSouthSampleData)
    static var regionSet = [californiaNorth, californiaSouth]
}
#endif
