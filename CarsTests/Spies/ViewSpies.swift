//
//  ViewSpies.swift
//  CarsTests
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

@testable import Cars

class CarsMapViewSpy: ICarsMapView {
    
    var didSetLoading: Bool = false
    var didPopulateMap: Bool = false
    var didShowError: Bool = false
    
    func set(loading: Bool) {
        didSetLoading = true
    }
    
    func populateMap() {
        didPopulateMap = true
    }
    
    func showError(message: String, retry: @escaping () -> Void) {
        didShowError = true
    }
    
}
