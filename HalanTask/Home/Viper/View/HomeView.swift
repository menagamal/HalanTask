//
//  HomeView.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit
protocol HomeView:class {
    
    var servicesStack: UIStackView! {
        get set
    }
    func showError(errorStr:String)
    func showTermsDialog(message:String)
    func showLocationError()
}
