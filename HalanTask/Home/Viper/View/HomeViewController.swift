//
//  ViewController.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit
import CoreLocation
class HomeViewController: UIViewController,HomeView,CLLocationManagerDelegate {
    
    var presenter : HomePresenter!
    
    var locManager = CLLocationManager()
    
    
    @IBOutlet weak var servicesStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeBuilder().build(vc: self, navigator: self.navigationController!)
        presenter = HomePresenter(interactor: HomeInteractor(), router: HomeRouter(navigationController: self.navigationController!), view: self)
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        
        let authorizationStatus = CLLocationManager.authorizationStatus()
        switch authorizationStatus {
        case .authorizedAlways:
            print("authorized")
        case .authorizedWhenInUse:
            print("authorized when in use")
        case .denied:
            print("denied")
        case .notDetermined:
            print("not determined")
        case .restricted:
            print("restricted")
        }
        
        locManager.requestWhenInUseAuthorization()
        locManager.startUpdatingLocation()
        presenter.loadCachedData()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        
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

