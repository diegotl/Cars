//
//  CarsMapPresenter.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

protocol ICarsMapView: class {
    func set(loading: Bool)
    func populateMap()
    func showError(message: String, retry: @escaping () -> Void )
}

protocol ICarsMapPresenter {
    var cars: [Car] { get }
    
    func loadCarList()
    func presentCarListView()
    func presentCarDetails(_ car: Car)
}

class CarsMapPresenter: ICarsMapPresenter, CarsListDelegate {

    private weak var view: ICarsMapView?
    private let useCaseFactory: IUseCaseFactory
    private let routerFactory: IRouterFactory
    
    private lazy var listCarsUseCase: IListCarsUseCase = useCaseFactory.createListCarsUseCase()
    private lazy var carsListViewRouter: ICarsListViewRouter = routerFactory.createCarsListViewRouter(delegate: self)
    private lazy var carDetailsViewRouter: ICarDetailsViewRouter = routerFactory.createCarDetailsViewRouter()
    
    var cars: [Car] = []
    
    init(view: ICarsMapView?, useCaseFactory: IUseCaseFactory, routerFactory: IRouterFactory) {
        self.view = view
        self.useCaseFactory = useCaseFactory
        self.routerFactory = routerFactory
    }
    
    func loadCarList() {
        self.view?.set(loading: true)
        
        listCarsUseCase.list { result in
            do {
                self.cars = try result.get()
                self.view?.populateMap()
            } catch {
                self.view?.showError(message: error.localizedDescription, retry: {
                    self.loadCarList()
                })
            }
            
            self.view?.set(loading: false)
        }
        
    }
    
    func presentCarListView() {
        carsListViewRouter.present(cars: self.cars)
    }
    
    func presentCarDetails(_ car: Car) {
        carDetailsViewRouter.navigateTo(car: car)
    }

}
