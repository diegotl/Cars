//
//  Storyboard.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/04/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit

enum Storyboard: String {
    case main
    
    var fileName: String {
        return rawValue.capitalized
    }
}

extension Storyboard {
    
    func instantiate<T>(_ viewClass: T.Type) -> T {
        return instantiate(String(describing: viewClass), type: T.self)
    }
    
    func instantiate<T>(_ identifier: String, type: T.Type) -> T {
        // swiftlint:disable force_cast
        return UIStoryboard(name: fileName, bundle: Bundle.main).instantiateViewController(withIdentifier: identifier) as! T
        // swiftlint:enable force_cast
    }
    
}
