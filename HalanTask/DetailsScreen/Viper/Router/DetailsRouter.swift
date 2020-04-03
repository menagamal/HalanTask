//
//  DetailsRouter.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
import UIKit

class DetailsRouter: BaseRouter{
    enum Destination {
        case None
    }
    
    var navigationController: UINavigationController?
    // MARK: - Initializer
    
    init() {
        
    }
   
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigate(to destination: DetailsRouter.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
     func root(to destination: DetailsRouter.Destination) {
         let viewController = makeViewController(for: destination)
         navigationController?.viewControllers = [viewController]
     
         UIApplication.shared.keyWindow?.rootViewController = navigationController
     }
    
    func present(to destination: DetailsRouter.Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.present(viewController, animated: true) {}
    }

    func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
     
        case .None:
            return UIViewController()
        }
    }
    
}
