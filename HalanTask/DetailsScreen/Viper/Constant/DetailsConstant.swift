//
//  DetailsConstant.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
enum DetailsError :Error {
    
    case FoundNil
    
    var localizedDescription: String {
        switch self {
        case .FoundNil:
            return "the data could not be read in the correct format."
        }
    }
}
