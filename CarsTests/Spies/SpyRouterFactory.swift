//
//  SpyRouterFactory.swift
//  CarsTests
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

@testable import Cars

struct SpyRouterFactory: IRouterFactory {
    
    let carsMapViewRouter: ICarsMapViewRouter = CarsMapViewRouterSpy()
    let carsListViewRouter: ICarsListViewRouter = CarsListViewRouterSpy()
    let carDetailsViewRouter: ICarDetailsViewRouter = CarDetailsViewRouterSpy()
    
    func createCarsMapViewRouter() -> ICarsMapViewRouter {
        return carsMapViewRouter
    }
    
    func createCarsListViewRouter(delegate: CarsListDelegate?) -> ICarsListViewRouter {
        return carsListViewRouter
    }
    
    func createCarDetailsViewRouter() -> ICarDetailsViewRouter {
        return carDetailsViewRouter
    }
    
}
