//
//  CarGateway.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

protocol CarGateway {
    func list(completion: @escaping (_ result: Result<[Car], Error>) -> Void)
}
