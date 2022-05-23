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
     
    init(name: String, surfSpots: [SurfSpot]) {
        self.name = name
        self.surfSpots = surfSpots
    }
}

#if DEBUG
extension SurfSpot {
    static var californiaSouthSampleData = [
        SurfSpot(spotName: "Oceanside"),
        SurfSpot(spotName: "Oceanside Pier"),
        SurfSpot(spotName: "Grandview"),
        SurfSpot(spotName: "Terra Mar"),
        SurfSpot(spotName: "Swamis"),
        SurfSpot(spotName: "Ocean Beach"),
        SurfSpot(spotName: "Sunset Cliffs"),
        SurfSpot(spotName: "Imperial Beach"),
        SurfSpot(spotName: "Point Loma")
    ]
    
    static var californiaNorthSampleData = [
        SurfSpot(spotName: "Steamer Lane"),
        SurfSpot(spotName: "Three Mile"),
        SurfSpot(spotName: "Pacifica Pier"),
        SurfSpot(spotName: "Pacifica"),
        SurfSpot(spotName: "Linda Mar"),
        SurfSpot(spotName: "Montara State Beach"),
        SurfSpot(spotName: "Mavericks")
    ]
}

extension Region {
    static var californiaNorth = Region(name: "California - North", surfSpots: SurfSpot.californiaNorthSampleData)
    static var californiaSouth = Region(name: "California - South", surfSpots: SurfSpot.californiaSouthSampleData)
    static var regionSet = [californiaNorth, californiaSouth]
}
#endif


//var regionSet = [Region]()
//
//
//californiaSouth.surfSpots += [oceanside,
//                              oceansidePier,
//                              grandview,
//                              terramar,
//                              swamis,
//                              oceanBeach,
//                              sunsetCliffs,
//                              imperialBeach,
//                              pointLoma]
//californiaNorth.surfSpots += [steamerLane,
//                              threeMile,
//                              pacificaPier,
//                              pacifica,
//                              lindaMar,
//                              montaraStateBeach,
//                              mavericks]
//regionSet += [californiaNorth, californiaSouth]
