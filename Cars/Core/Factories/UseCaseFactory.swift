//
//  UseCaseFactory.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

protocol IUseCaseFactory {
    func createListCarsUseCase() -> IListCarsUseCase
}

struct UseCaseFactory: IUseCaseFactory {
    
    func createListCarsUseCase() -> IListCarsUseCase {
        return ListCarsUseCase(gateway: GatewayFactory.api.car)
    }
    
}
