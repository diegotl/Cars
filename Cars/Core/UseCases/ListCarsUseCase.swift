//
//  ListCarsUseCase.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

protocol IListCarsUseCase {
    func list(completion: @escaping (_ result: Result<[Car], Error>) -> Void)
}

struct ListCarsUseCase: IListCarsUseCase {

    let gateway: CarGateway
    
    func list(completion: @escaping (Result<[Car], Error>) -> Void) {
        gateway.list(completion: completion)
    }

}
