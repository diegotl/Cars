//
//  Urls.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import APIClient

enum Endpoints: APIEndpointPath {
    case listCars
    
    var value: String {
        switch self {
            case .listCars: return "/codingtask/cars"
        }
    }
}
