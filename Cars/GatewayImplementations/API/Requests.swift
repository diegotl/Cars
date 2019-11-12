//
//  Requests.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import APIClient

class ListCarsRequest: APIRequest {
    init() {
        let endpoint = APIEndpoint(environment: Environment.production, path: Endpoints.listCars)
        super.init(endpoint: endpoint, method: .get, encoding: .queryString(nil))
    }
}
