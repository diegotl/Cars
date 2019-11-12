//
//  CarsMapConfigurator.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

protocol ICarsMapConfigurator {
    func configure(_ viewController: CarsMapViewController)
}

struct CarsMapConfigurator: ICarsMapConfigurator {
    
    func configure(_ viewController: CarsMapViewController) {
        let useCaseFactory = UseCaseFactory()
        let routerFactory = RouterFactory(parent: viewController, navigationController: viewController.navigationController)
        
        viewController.presenter = CarsMapPresenter(view: viewController,
                                                    useCaseFactory: useCaseFactory,
                                                    routerFactory: routerFactory)
    }
    
}
