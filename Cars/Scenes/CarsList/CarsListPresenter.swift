//
//  CarsListPresenter.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

protocol ICarsListView: class {

}

protocol CarsListDelegate: class {
    func presentCarDetails(_ car: Car)
}

protocol ICarsListPresenter {
    var cars: [Car] { get }
    
    func openItem(at index: Int)
}

struct CarsListPresenter: ICarsListPresenter {

    private(set) weak var view: ICarsListView?
    private(set) weak var delegate: CarsListDelegate?
    let cars: [Car]
    
    func openItem(at index: Int) {
        let car = cars[index]
        delegate?.presentCarDetails(car)
    }

}
