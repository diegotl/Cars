//
//  CarDetailsViewController.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit

private let headerHeight: CGFloat = 200.0
private let maxOffset: CGFloat = 100.0

class CarDetailsViewController: UIViewController, ICarDetailsView, UITableViewDelegate, UITableViewDataSource {
    
    var configurator: ICarDetailsConfigurator!
    var presenter: ICarDetailsPresenter!
    
    @IBOutlet private weak var headerHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var photoView: CacheImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var modelLabel: UILabel!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setupUI() {
        title = "Details"
        
        tableView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
        tableView.scrollIndicatorInsets  = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
        
        let car = presenter.car
        photoView.imageUrl = car.carImageUrl
        nameLabel.text = "\(car.name)'s"
        modelLabel.text = car.modelName
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = min(headerHeight + scrollView.contentOffset.y, maxOffset)
        let newHeaderHeight: CGFloat = headerHeight - offset
        headerHeightConstraint.constant = newHeaderHeight
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.car.tableInfo.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.car.tableInfo[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.car.tableInfo[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttributeCell", for: indexPath) as! AttributeCell
        let sectionInfo = presenter.car.tableInfo[indexPath.section]
        let cellInfo = sectionInfo.cells[indexPath.row]
        cell.set(title: cellInfo.title, value: cellInfo.value)
        return cell
    }
    
}
