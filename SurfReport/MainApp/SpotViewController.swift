//
//  ViewController.swift
//  SurfReport
//
//  Created by Dalton Turner on 5/19/22.
//

import UIKit

class SpotViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    private let regionSet = Region.regionSet

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.title = "Surf Reports"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

// MARK: - UITableViewDataSource

extension SpotViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        regionSet.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return regionSet[section].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regionSet[section].surfSpots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = regionSet[indexPath.section].surfSpots[indexPath.row].spotName
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SpotViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let spot = regionSet[indexPath.section].surfSpots[indexPath.row]
        let latString = "Latitude: \(spot.location.coordinate.latitude)"
        let lonString = "Longitude: \(spot.location.coordinate.longitude)"

        let spotDetails = SpotDetailsViewController(items: [
            latString,
            lonString
        ])
        spotDetails.title = spot.spotName
        navigationController?.pushViewController(spotDetails, animated: true)
    }
}
