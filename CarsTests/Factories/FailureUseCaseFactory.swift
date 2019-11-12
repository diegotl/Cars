//
//  FailureUseCaseFactory.swift
//  CarsTests
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import Foundation

@testable import Cars

class FailureUseCaseFactory: IUseCaseFactory {
    
    func createListCarsUseCase() -> IListCarsUseCase {
        let error = NSError(domain: "UseCaseFactory", code: 1, userInfo: [:])
        let gateway = CarGatewayStub(result: Result.failure(error))
        return ListCarsUseCase(gateway: gateway)
    }
    
}
