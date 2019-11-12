//
//  RouterSpies.swift
//  CarsTests
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

@testable import Cars

class CarsMapViewRouterSpy: ICarsMapViewRouter {
    
}

class CarsListViewRouterSpy: ICarsListViewRouter {
    
    var didPresent: Bool = false
    
    func present(cars: [Car]) {
        didPresent = true
    }
    
}

class CarDetailsViewRouterSpy: ICarDetailsViewRouter {
    
    var didNavigateTo: Bool = false
    
    func navigateTo(car: Car) {
        didNavigateTo = true
    }
    
}
