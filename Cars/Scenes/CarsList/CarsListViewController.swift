//
//  CarsListViewController.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class CarsListViewController: UITableViewController, ICarsListView {
    
    var configurator: ICarsListConfigurator!
    var presenter: ICarsListPresenter!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        dismiss(animated: true) {
            self.presenter.openItem(at: indexPath.row)
        }
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.cars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as! CarCell
        cell.car = presenter.cars[indexPath.row]
        return cell
    }
    
}
