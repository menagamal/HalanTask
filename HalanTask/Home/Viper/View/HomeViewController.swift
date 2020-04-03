//
//  ViewController.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit
import CoreLocation
class HomeViewController: UIViewController,HomeView {
    
    var presenter : HomePresenter!
    
    var locManager:CLLocationManager!
    
    @IBOutlet weak var servicesStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeBuilder().build(vc: self, navigator: self.navigationController!)
        presenter = HomePresenter(interactor: HomeInteractor(), router: HomeRouter(navigationController: self.navigationController!), view: self)
        locManager = CLLocationManager()
        locManager.requestAlwaysAuthorization()
        presenter.loadCachedData()
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        switch motion {
        case .motionShake:
            self.presenter.getAllServices()
            break
        default:
            break
        }
    }
    
    func showError(errorStr: String) {
        // ADD TOAST
        Toast.showAlert(viewController: self, text: errorStr)
    }
    
    func showLocationError() {
        Toast.showAlert(viewController: self, text: "Please Allow Using The Location For the App Since it is Mandatory.", style: .alert, UIAlertAction(title: "Cancel", style: .default, handler: nil),UIAlertAction(title: "Allow", style: .default, handler: { (action) in
            // Go To Settings
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    print("Settings opened: \(success)") // Prints true
                })
            }
        }))
    }
    
    
    func showTermsDialog(message: String) {
        Toast.showAlert(viewController: self, text: message, style: .alert, UIAlertAction(title: "Cancel", style: .default, handler: nil),UIAlertAction(title: "Allow", style: .default, handler: { (action) in
            self.presenter.showDetailScreen()
        }))
    }
    
    
}

