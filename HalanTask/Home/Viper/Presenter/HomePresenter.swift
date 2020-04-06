//
//  HomePresenter.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
import CoreLocation

protocol HomePresenterDelegate {
    func loadCategoriesStackView()
    func getAllServices()
    func loadCachedData()
    func showDetailScreen()
    func listen() -> (Double,Double)
}

class HomePresenter: HomePresenterDelegate,CategoryViewDelegate {
    
    private var interactor:HomeInteractor?
    private var router:HomeRouter?
    
    //MARK: TO AVOID RETAIN CYCLE
    private weak var view:HomeView?
    
    private var categories = [DataModel]()
    private var services:Services!
    var locManager:CLLocationManager!
    var currentLocation:CLLocation!
    
    init(interactor:HomeInteractor,router:HomeRouter,view:HomeView) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    
    func getAllServices()  {
        let locationTuple = self.listen()
        if (locationTuple.0 == 0.0) && (locationTuple.1 == 0.0) {
            self.view?.showLocationError()
        } else {
            interactor?.getAllSevices(lat: locationTuple.0,lon: locationTuple.1, completation: { (response) in
                
                if let error = response.0 {
                    self.view?.showError(errorStr: error.localizedDescription)
                } else {
                    self.categories = response.1
                    self.loadCategoriesStackView()
                }
            })
        }
        
        
    }
    
    func loadCategoriesStackView()  {
        for item in (self.view?.servicesStack.subviews)! {
            item.removeFromSuperview()
            self.view?.servicesStack.removeArrangedSubview(item)
        }
        for (i,item) in categories.enumerated() {
            let view = CategoryView.loadFromNib(named: "CategoryView") as! CategoryView
            view.setDetails(model: item, delegate: self, completation: { img in
                let imageData = img.pngData()
                let imageToBaseStr = imageData!.base64EncodedString(options: .lineLength76Characters)
                self.categories[i].imageBase64 = imageToBaseStr
            })
            
            
            self.view?.servicesStack.addArrangedSubview(view)
        }
        
        
        
    }
    
    func loadCachedData()  {
        let obj = interactor?.loadAllCachedData()
        if let cats = obj?.modules ,!cats.isEmpty {
            self.categories.removeAll()
            self.categories = cats
            loadCategoriesStackView()
        } else {
            //load api
            let locationTuple = self.listen()
            if (locationTuple.0 == 0.0) && (locationTuple.1 == 0.0) {
                self.view?.showLocationError()
            } else {
                self.getAllServices()
            }
            
        }
        
    }
    
    func didSelect(services: Services) {
        self.services = services
        if let term = services.termsKey , !term.isEmpty{
            self.view?.showTermsDialog(message: term)
        } else {
            self.router?.navigate(to: .ShowDetail(services: services))
        }
        
    }
    func showDetailScreen() {
        self.router?.navigate(to: .ShowDetail(services: self.services))
    }
    
    func shouldCache() {
        self.interactor?.saveCachedItems(categories: self.categories)
    }
    
    
    func listen() -> (Double,Double) {
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            locManager = CLLocationManager()
            if locManager != nil {
                guard let currentLocation = locManager.location else {
                    return (0.0,0.0)
                }
                return(Double(currentLocation.coordinate.latitude),Double(currentLocation.coordinate.longitude))
            }
            
            
            
        }
        return (0.0,0.0)
    }
}
