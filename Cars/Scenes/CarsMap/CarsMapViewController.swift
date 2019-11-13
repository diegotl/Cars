//
//  CarsMapViewController.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import UIKit
import MapKit

class CarsMapViewController: UIViewController, ICarsMapView {
    
    var configurator: ICarsMapConfigurator! = CarsMapConfigurator()
    var presenter: ICarsMapPresenter!
    
    @IBOutlet private weak var spinnerView: UIActivityIndicatorView!
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var buttonContainerView: UIView!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setupUI() {
        buttonContainerView.layer.cornerRadius = 12
        buttonContainerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        presenter.loadCarList()
    }
    
    // MARK: - ICarsMapView
    
    func set(loading: Bool) {
        UIView.animate(withDuration: 0.15) {
            if loading {
                self.spinnerView.startAnimating()
                self.mapView.alpha = 0.0
            } else {
                self.spinnerView.stopAnimating()
                self.mapView.alpha = 1.0
            }
        }
    }
    
    func populateMap() {
        let annotations = presenter.cars.map({ return CarAnnotation(car: $0) })
        
        mapView.register(CarMarkerView.self, forAnnotationViewWithReuseIdentifier: "CarMarker")
        mapView.showAnnotations(annotations, animated: true)
    }
    
    func showError(message: String, retry: @escaping () -> Void) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let retryAction = UIAlertAction(title: "Retry", style: .default) { _ in
            retry()
        }
        alertController.addAction(retryAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    
    @IBAction private func showList() {
        presenter.presentCarListView()
    }
    
}

extension CarsMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MKPointAnnotation else { return nil }
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "CarMarker", for: annotation)

        annotationView.canShowCallout = true
        annotationView.rightCalloutAccessoryView = UIButton(type: .infoLight)

        return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let carAnnotation = view.annotation as? CarAnnotation else { return }
        presenter.presentCarDetails(carAnnotation.car)
    }
    
}
