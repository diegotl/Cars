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
    
    var title: String {
        switch self {
        case .automatic:
            return "Automatic"
        case .manual:
            return "Manual"
        }
    }
}

enum InnerCleanliness: String, Codable {
    case regular    = "REGULAR"
    case clean      = "CLEAN"
    case veryClean  = "VERY_CLEAN"
    
    var title: String {
        return rawValue.capitalized.replacingOccurrences(of: "_", with: " ")
    }
}

// Dear reviewer: sorry, I don't know what P, D and E stands for, so I guessed 😅
enum FuelType: String, Codable {
    case petroleum  = "P"
    case diesel     = "D"
    case ethanol    = "E"
    
    var title: String {
        switch self {
        case .petroleum:
            return "Petroleum"
        case .diesel:
            return "Diesel"
        case .ethanol:
            return "Ethanol"
        }
    }
}

enum CarColor: String, Codable {
    case midnightBlackMetal = "midnight_black_metal"
    case midnightBlack      = "midnight_black"
    case hotChocolate       = "hot_chocolate"
    case icedChocolateMetal = "iced_chocolate_metal"
    case lightWhite         = "light_white"
    case icedChocolate      = "iced_chocolate"
    case alpinweiss         = "alpinweiss"
    case saphirschwarz      = "saphirschwarz"
    case absoluteBlackMetal = "absolute_black_metal"
    case schwarz            = "schwarz"
    
    var title: String {
        return rawValue.capitalized.replacingOccurrences(of: "_", with: " ")
    }
}

struct Car: Codable {
    let id: String
    let modelIdentifier: String
    let modelName: String
    let name: String
    let make: String
    let group: String
    let color: CarColor
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
    
    var tableInfo: [SectionInfo] {
        return [
            SectionInfo(title: "Vehicle", cells: [
                CellInfo(title: "Manufactor", value: make),
                CellInfo(title: "Model", value: modelName),
                CellInfo(title: "Group", value: group),
                CellInfo(title: "Series", value: series),
                CellInfo(title: "Color", value: color.title)
            ]),
            SectionInfo(title: "Fuel", cells: [
                CellInfo(title: "Type", value: fuelType.title),
                CellInfo(title: "Level", value: "\(fuelLevel * 100)%")
            ]),
            SectionInfo(title: "Transmission", cells: [
                CellInfo(title: "Type", value: transmission.title)
            ]),
            SectionInfo(title: "Other", cells: [
                CellInfo(title: "Owner", value: name),
                CellInfo(title: "Plate", value: licensePlate),
                CellInfo(title: "Cleanliness", value: innerCleanliness.title)
            ])
        ]
    }
}
