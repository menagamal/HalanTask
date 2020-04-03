//
//  HomeBuilder.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
import UIKit

class HomeBuilder {
    func build(vc:HomeViewController,navigator:UINavigationController) {
        
        let interactor = HomeInteractor()
        let router = HomeRouter(navigationController: navigator)
        vc.presenter = HomePresenter(interactor: interactor, router: router, view: vc)
        
    }
}
