//
//  CarsMapPresenterTests.swift
//  CarsTests
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import XCTest

@testable import Cars

class CarsMapPresenterTests: XCTestCase {
    
    var viewSpy: CarsMapViewSpy!
    var successUseCaseFactory: IUseCaseFactory!
    var failureUseCaseFactory: IUseCaseFactory!
    var routerFactory: IRouterFactory!

    override func setUp() {
        viewSpy = CarsMapViewSpy()
        successUseCaseFactory = SuccessUseCaseFactory()
        failureUseCaseFactory = FailureUseCaseFactory()
        routerFactory = SpyRouterFactory()
    }

    func test_load_car_list_success() {
        let presenter = CarsMapPresenter(view: viewSpy, useCaseFactory: successUseCaseFactory, routerFactory: routerFactory)
        presenter.loadCarList()
        
        XCTAssertTrue(viewSpy.didSetLoading)
        XCTAssertTrue(viewSpy.didPopulateMap)
    }
    
    func test_load_car_list_failure() {
        let presenter = CarsMapPresenter(view: viewSpy, useCaseFactory: failureUseCaseFactory, routerFactory: routerFactory)
        presenter.loadCarList()
        
        XCTAssertTrue(viewSpy.didSetLoading)
        XCTAssertFalse(viewSpy.didPopulateMap)
        XCTAssertTrue(viewSpy.didShowError)
    }

}
