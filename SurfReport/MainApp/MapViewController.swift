//
//  MapViewController.swift
//  SurfReport
//
//  Created by Dalton Turner on 7/7/22.
//

import MapKit
import UIKit

class MapViewController: UIViewController {
    
    let mapView : MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
        return map
    }()
    
    // Set initial location to be near Fresno to show all of California
    let initialLocation = CLLocation(latitude: 36.675459, longitude:  -119.811238)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
        let spotCoordinates = generateCoordinates(regions: Region.regionSet)
        addAnnotations(coords: spotCoordinates)
    }
    
    private func style() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.centerToLocation(initialLocation)
    }
    
    private func layout() {
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
    private func generateCoordinates(regions: [Region]) -> [CLLocation] {
        var coordinates = [CLLocation]()
        for region in regions {
            for spot in region.surfSpots {
                let coordinate = CLLocation(latitude: spot.latitude, longitude: spot.longitude)
                coordinates.append(coordinate)
            }
        }
        return coordinates
    }
    
    private func addAnnotations(coords: [CLLocation]){
        for coord in coords {
            let CLLCoordType = CLLocationCoordinate2D(latitude: coord.coordinate.latitude,
                                                      longitude: coord.coordinate.longitude)
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLCoordType
            mapView.addAnnotation(annotation)
        }
    }
}
