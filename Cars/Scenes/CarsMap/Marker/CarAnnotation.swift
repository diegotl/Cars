//
//  CarAnnotation.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import MapKit

class CarAnnotation: MKPointAnnotation {
    
    let car: Car
    
    init(car: Car) {
        self.car = car
        super.init()
        
        self.coordinate = car.coordinate
        self.title = car.name
        self.subtitle = car.make
    }

}
