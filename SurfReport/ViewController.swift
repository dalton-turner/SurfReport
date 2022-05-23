//
//  ViewController.swift
//  SurfReport
//
//  Created by Dalton Turner on 5/19/22.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    
    var steamerLane = SurfSpot(spotName: "Steamer Lane")
    var threeMile = SurfSpot(spotName: "Three Mile")
    var swamis = SurfSpot(spotName: "Swamis")
    var oceanBeach = SurfSpot(spotName: "Ocean Beach")
    var imperialBeach = SurfSpot(spotName: "Imperial Beach")
    var pointLoma = SurfSpot(spotName: "Point Loma")
    var sunsetCliffs = SurfSpot(spotName: "Sunset Cliffs")
    var californiaNorth = Region(name: "California - North")
    var californiaSouth = Region(name: "California - South")
    
    var regionSet = [Region]()

    override func viewDidLoad() {
        super.viewDidLoad()
        californiaSouth.surfSpots += [imperialBeach,
                                      pointLoma,
                                      sunsetCliffs,
                                      swamis,
                                      oceanBeach]
        californiaNorth.surfSpots += [steamerLane,
                                      threeMile]
        regionSet += [californiaNorth, californiaSouth]
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
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
        let largeConfiguration = UIImage.SymbolConfiguration(scale: .large)
        cell.imageView?.image = UIImage(systemName: "info.circle", withConfiguration: largeConfiguration)
//        cell.imageView?.image = UIImage(systemName: symbolSet[indexPath.section].iconName?[indexPath.row] ?? "",
//                                        withConfiguration: largeConfiguration)
        cell.textLabel?.text = regionSet[indexPath.section].surfSpots[indexPath.row].spotName
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
