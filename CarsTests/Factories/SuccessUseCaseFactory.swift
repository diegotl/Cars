//
//  SuccessUseCaseFactory.swift
//  CarsTests
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import Foundation

@testable import Cars

class SuccessUseCaseFactory: IUseCaseFactory {
    
    func createListCarsUseCase() -> IListCarsUseCase {
        let cars = [Car(id: "1", modelIdentifier: "Model", modelName: "ModelName", name: "Name", make: "make", group: "Group", color: "Color", series: "Series", fuelType: .ethanol, fuelLevel: 1.0, transmission: .automatic, licensePlate: "Plate", latitude: 0.0, longitude: 0.0, innerCleanliness: .clean, carImageUrl: URL(string: "http://www.google.com")!)]
        let gateway = CarGatewayStub(result: Result.success(cars))
        return ListCarsUseCase(gateway: gateway)
    }
    
}
