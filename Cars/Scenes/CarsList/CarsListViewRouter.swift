//
//  CarsListViewRouter.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol ICarsListViewRouter {
    func present(cars: [Car])
}

struct CarsListViewRouter: ICarsListViewRouter {
    
    private(set) weak var parent: UIViewController?
    private(set) weak var delegate: CarsListDelegate?

    func present(cars: [Car]) {
        let viewController = Storyboard.main.instantiate(CarsListViewController.self)
        viewController.configurator = CarsListConfigurator(delegate: delegate, cars: cars)
        parent?.present(viewController, animated: true, completion: nil)
    }

}
