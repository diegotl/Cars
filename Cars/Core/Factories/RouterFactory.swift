//
//  RouterFactory.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit

protocol IRouterFactory {
    func createCarsMapViewRouter() -> ICarsMapViewRouter
    func createCarsListViewRouter(delegate: CarsListDelegate?) -> ICarsListViewRouter
    func createCarDetailsViewRouter() -> ICarDetailsViewRouter
}

struct RouterFactory: IRouterFactory {
    
    let parent: UIViewController?
    let navigationController: UINavigationController?
    
    func createCarsMapViewRouter() -> ICarsMapViewRouter {
        return CarsMapViewRouter()
    }
    
    func createCarsListViewRouter(delegate: CarsListDelegate?) -> ICarsListViewRouter {
        return CarsListViewRouter(parent: parent, delegate: delegate)
    }
    
    func createCarDetailsViewRouter() -> ICarDetailsViewRouter {
        return CarDetailsViewRouter(navigationController: navigationController)
    }
    
}
