//
//  CarsListPresenter.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

protocol ICarsListView: class {

}

protocol ICarsListPresenter {
    var cars: [Car] { get }
}

struct CarsListPresenter: ICarsListPresenter {

    private(set) weak var view: ICarsListView?
    let cars: [Car]

}
