//
//  DetailsPresenter.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

protocol DetailsPresenterDelegate {
    func loadData()
}

class DetailsPresenter: DetailsPresenterDelegate {
    
    private var interactor:DetailsInteractor?
    private var router:DetailsRouter?
    
    //MARK: TO AVOID RETAIN CYCLE
    private weak var view:DetailsView?
    var services:Services!
    
    init(interactor:DetailsInteractor,router:DetailsRouter,view:DetailsView,services:Services) {
        self.interactor = interactor
        self.router = router
        self.view = view
        self.services = services
    }
    
    func loadData() {
        self.view?.labelTitle.text = services.name
    }
  
    
}
