//
//  HomeRouter.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//



import Foundation
import UIKit


class HomeRouter: BaseRouter{
    enum Destination {
        case ShowDetail(services:Services),None
    }
    var navigationController: UINavigationController?
    // MARK: - Initializer
    
    init() {
        
    }
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    
    func navigate(to destination: HomeRouter.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func root(to destination: HomeRouter.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.viewControllers = [viewController]
        
        UIApplication.shared.keyWindow?.rootViewController = navigationController
    }
    
    func present(to destination: HomeRouter.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.present(viewController, animated: true) {}
    }
    private func detailsViewController(services:Services) -> DetailsViewController {
        let vc: DetailsViewController = DetailsBuilder().build(navigationController: self.navigationController!, services: services)
        return vc
    }
    
    func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .ShowDetail(let services):
            return detailsViewController(services: services)
        case .None:
            return UIViewController()
        }
    }
    
}
