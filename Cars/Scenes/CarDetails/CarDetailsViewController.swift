//
//  CarDetailsViewController.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit

class CarDetailsViewController: UIViewController, ICarDetailsView {
    
    var configurator: ICarDetailsConfigurator!
    var presenter: ICarDetailsPresenter!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
    }
    
}
