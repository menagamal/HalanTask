//
//  HomeTarget.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/3/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
import Moya

typealias MoyaMethod = Moya.Method

enum HomeTarget {
    case getAllServices(lat:Double,lon:Double)
}

extension HomeTarget: TargetType {
    var baseURL: URL {
        return URL(string: AppConstant.API.BaseUrl)!
    }
    
    var path: String {
        switch self {
            
        case .getAllServices:
            return HomeConstant.API.getAllServices.endPoint
            
        }
    }
    
    var method: MoyaMethod {
        switch self {
            
        case .getAllServices:
            return .get
            
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getAllServices:
            return  HomeConstant.API.getAllServices.SampleData.data(using: String.Encoding.utf8)!
            
        }
    }
    
    var task: Task {
        switch self {
        case .getAllServices:
            return .requestPlain
        }
    }
    
    public var headers: [String: String]? {
        switch self {
        case .getAllServices(let lat , let lon):
            var servicesHeaders = [String:String]()
            servicesHeaders[HomeConstant.Keys.language] = "en"
            servicesHeaders[HomeConstant.Keys.long] = "\(lon)"
            servicesHeaders[HomeConstant.Keys.lat] = "\(lat)"
            servicesHeaders[HomeConstant.Keys.Authorization] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI1ZTQxNTAxNDcyNDhkODAwMTIzYWQ2OTIiLCJ1c2VyUmVxdWVzdENvbnRyb2xsIjpudWxsLCJ0eXBlIjoiVXNlciIsImlzSDM2MCI6ZmFsc2UsImlhdCI6MTU4MjE5NzgyNSwiZXhwIjoxNjEzNzU1NDI1fQ.tjG_zLonYtcKAkZdLR1jU5EkowddfB8wuIOWOiPT0yo"
            servicesHeaders[HomeConstant.Keys.version] = "ios-5"
            
            
            return servicesHeaders
        }
        
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}

