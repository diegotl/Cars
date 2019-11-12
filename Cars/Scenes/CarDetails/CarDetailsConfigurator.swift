//
//  CarDetailsConfigurator.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

protocol ICarDetailsConfigurator {
    func configure(_ viewController: CarDetailsViewController)
}

struct CarDetailsConfigurator: ICarDetailsConfigurator {
    
    let car: Car
    
    func configure(_ viewController: CarDetailsViewController) {
        viewController.presenter = CarDetailsPresenter(view: viewController, car: car)
    }
    
}
