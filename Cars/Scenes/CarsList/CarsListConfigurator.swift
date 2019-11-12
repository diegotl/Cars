//
//  CarsListConfigurator.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

protocol ICarsListConfigurator {
    func configure(_ viewController: CarsListViewController)
}

struct CarsListConfigurator: ICarsListConfigurator {
    
    private(set) weak var delegate: CarsListDelegate?
    let cars: [Car]
    
    func configure(_ viewController: CarsListViewController) {
        viewController.presenter = CarsListPresenter(view: viewController, delegate: delegate, cars: cars)
    }
    
}
