//
//  HomeConstant.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation

enum HomeConstant {
    struct Keys {
        static let cachedItems = "cachedItems"
        
        static let language = "language"
        static let long = "long"
        static let lat = "lat"
        static let Authorization = "Authorization"
        static let device = "device"
        static let version = "version"
        
    }
    
    
    enum API {
        enum getAllServices {
            static let endPoint = "services"
            static let SampleData =
            """
            {
               "status": 200,
               "message": "Success!",
               "data": [
                   {
                       "naming": "Halan Ride Hailing",
                       "pic": "https://s3.us-east-2.amazonaws.com/halan-services/",
                       "prefix": "RideHailing",
                       "services": [
                           {
                               "name": "Taxi",
                               "pic": "https://cdn.halan.io/images/",
                               "id": "5e70db5778825a0c27ca53ee",
                               "prefix": "taxi",
                               "vehicleType": "taxi",
                               "serviceType": "RideHailing"
                           },
                           {
                               "name": "TukTuk",
                               "pic": "https://cdn.halan.io/images/",
                               "id": "5d41b85f7bb31abfb9e63497",
                               "prefix": "toktok",
                               "vehicleType": "toktok",
                               "serviceType": "RideHailing"
                           }
                       ]
                   }
               ]
            }
            """
        }
        
    }
    
    enum HomeError :Error {
        case InvalidURL
        case ParsingError
        var localizedDescription: String {
            switch self {
            case .ParsingError:
                return "the data could not be read in the correct format."
            case .InvalidURL:
                return "Invalid Url Request"
            }
        }
    }
    
}
