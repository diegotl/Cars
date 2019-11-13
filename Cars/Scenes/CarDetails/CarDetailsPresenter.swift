//
//  CarDetailsPresenter.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

protocol ICarDetailsView: class {

}

protocol ICarDetailsPresenter {
    var car: Car { get }
}

struct CarDetailsPresenter: ICarDetailsPresenter {

    private(set) weak var view: ICarDetailsView?
    let car: Car

}
