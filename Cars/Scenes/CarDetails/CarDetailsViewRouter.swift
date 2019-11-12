//
//  CarDetailsViewRouter.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol ICarDetailsViewRouter {
    func navigateTo(car: Car)
}

struct CarDetailsViewRouter: ICarDetailsViewRouter {
    
    private(set) weak var navigationController: UINavigationController?

    func navigateTo(car: Car) {
        let view = Storyboard.main.instantiate(CarDetailsViewController.self)
        view.configurator = CarDetailsConfigurator(car: car)
        navigationController?.pushViewController(view, animated: true)
    }

}
