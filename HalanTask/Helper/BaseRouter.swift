//
//  BaseRouter.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
import UIKit

protocol BaseRouter {
    associatedtype Destination
    var navigationController: UINavigationController? { get set }
    func makeViewController(for destination: Destination) -> UIViewController
}

extension BaseRouter{
    func navigate(to destination: Destination){
        let viewController = makeViewController(for: destination)
        print(navigationController!)
        print(viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
    func root(to destination: Destination){
        let viewController = makeViewController(for: destination)
        navigationController?.viewControllers = [viewController]
        UIApplication.shared.keyWindow?.rootViewController = navigationController
        
    }
    func pop(){
        self.navigationController?.popViewController(animated: true)
    }
}
