//
//  Environments.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import APIClient

enum Environment: APIEnvionment {
    case production
    //case development
    
    var baseUrl: String {
        switch self {
            case .production: return "https://cdn.sixt.io"
            //case .development: return "https://dev.cdn.sixt.io"
        }
    }
}
