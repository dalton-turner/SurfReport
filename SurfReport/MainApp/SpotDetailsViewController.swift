//
//  TestSpotDetailsViewController.swift
//  SurfReport
//
//  Created by Dalton Turner on 7/11/22.
//

import UIKit

class SpotDetailsViewController: UIViewController {
    
    private let detailTableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let regionSet = Region.regionSet
    let surfData = ServiceManager.shared.provideParsedData(for: "SwamisSampleData2022-07-11")

    private var items: [Any]
    
    init(items: [Any]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        view.addSubview(detailTableView)
        detailTableView.delegate = self
        detailTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailTableView.frame = view.bounds
    }
}

// MARK: - UITableViewDataSource

extension SpotDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        surfData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        surfData[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        surfData[section].sectionObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()

        content.text = surfData[indexPath.section].sectionObjects[indexPath.row]
        
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SpotDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

