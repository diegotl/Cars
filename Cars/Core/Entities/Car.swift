//
//  Car.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import Foundation
import CoreLocation

enum TransmissionType: String, Codable {
    case automatic  = "A"
    case manual     = "M"
}

enum InnerCleanliness: String, Codable {
    case regular    = "REGULAR"
    case clean      = "CLEAN"
    case veryClean  = "VERY_CLEAN"
}

// Dear reviewer: sorry, I don't know what P, D and E means so I guessed 😅
enum FuelType: String, Codable {
    case petroleum  = "P"
    case diesel     = "D"
    case ethanol    = "E"
}

struct Car: Codable {
    let id: String
    let modelIdentifier: String
    let modelName: String
    let name: String
    let make: String
    let group: String
    let color: String
    let series: String
    let fuelType: FuelType
    let fuelLevel: Double
    let transmission: TransmissionType
    let licensePlate: String
    let latitude: Double
    let longitude: Double
    let innerCleanliness: InnerCleanliness
    let carImageUrl: URL
    
    // MARK: - Computed vars
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
