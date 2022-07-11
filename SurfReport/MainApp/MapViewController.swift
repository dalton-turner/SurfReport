//
//  MapViewController.swift
//  SurfReport
//
//  Created by Dalton Turner on 7/7/22.
//

import MapKit
import UIKit

class MapViewController: UIViewController {
    
    let mapView = MKMapView()
    private let regionSet = Region.regionSet
    
    // Set initial location to be near Fresno to show all of California
    private let initialLocation = CLLocation(latitude: 36.675459, longitude:  -119.811238)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    private func style() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.centerToLocation(initialLocation)
        
        addAnnotation(regions: Region.regionSet)
    }
    
    private func layout() {
        view.addSubview(mapView)
        
        mapView.delegate = self
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }

    private func addAnnotation(regions: [Region]){
        for region in regions {
            for spot in region.surfSpots {
                // Create spot coordinates to assign to map annotations
                let spotCoordinates = CLLocationCoordinate2D(
                    latitude: spot.location.coordinate.latitude,
                    longitude: spot.location.coordinate.longitude
                )
                
                // Set up annotations with coordinates and spot names
                let annotation = MKPointAnnotation()
                annotation.coordinate = spotCoordinates
                annotation.title = spot.spotName

                // Add new annotation to the map view
                mapView.addAnnotation(annotation)
            }
        }
    }

}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation,
              let spotName = annotation.title else {
            return
        }
        
        let latString = "Latitude: \(annotation.coordinate.latitude)"
        let lonString = "Longitude: \(annotation.coordinate.longitude)"

        let spotDetails = SpotDetailsViewController(items: [
            latString,
            lonString
        ])
        spotDetails.title = spotName
        navigationController?.pushViewController(spotDetails, animated: true)
    }
}
