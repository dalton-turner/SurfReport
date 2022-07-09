//
//  SpotsAndRegions.swift
//  SurfReport
//
//  Created by Dalton Turner on 5/19/22.
//

import Foundation

public struct SurfSpot {
    var spotName: String
    var latitude: Double
    var longitude: Double
}

public struct Region {
    var name: String
    var surfSpots = [SurfSpot]()
}

#if DEBUG
extension SurfSpot {
    static var californiaSouthSampleData = [
        SurfSpot(spotName: "Grandview",
                 latitude: 33.076475,
                 longitude: -117.310550),
        SurfSpot(spotName: "Swamis",
                 latitude: 33.034147,
                 longitude: -117.292539),
        SurfSpot(spotName: "Ocean Beach",
                 latitude: 32.755602,
                 longitude: -117.253075),
        SurfSpot(spotName: "Sunset Cliffs",
                 latitude: 32.719109,
                 longitude: -117.258046),
        SurfSpot(spotName: "Point Loma",
                 latitude: 32.668589,
                 longitude: -117.248338)
    ]

    static var californiaNorthSampleData = [
        SurfSpot(spotName: "Steamer Lane",
                 latitude: 36.951630,
                 longitude: -122.025644),
        SurfSpot(spotName: "Three Mile",
                 latitude:36.961086,
                 longitude: -122.113302),
        SurfSpot(spotName: "Pacifica",
                 latitude: 37.598580,
                 longitude: -122.504155),
        SurfSpot(spotName: "Montara State Beach",
                 latitude:37.546648,
                 longitude: -122.516429),
        SurfSpot(spotName: "Mavericks",
                 latitude:37.491619,
                 longitude: -122.499176)
    ]
}

extension Region {
    static var californiaNorth = Region(name: "California - North", surfSpots: SurfSpot.californiaNorthSampleData)
    static var californiaSouth = Region(name: "California - South", surfSpots: SurfSpot.californiaSouthSampleData)
    static var regionSet = [californiaNorth, californiaSouth]
}
#endif
