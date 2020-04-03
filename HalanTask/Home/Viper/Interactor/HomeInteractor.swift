//
//  HomeInteractor.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import DataCache
import Moya

typealias ServicesResponse = (Error?,[DataModel])


protocol HomeUseCase {
    func getAllSevices(lat:Double,lon:Double,completation:@escaping( (ServicesResponse)-> Void))
}

class HomeInteractor: HomeUseCase {
    
    var provider = MoyaProvider<HomeTarget>(callbackQueue: DispatchQueue.global(qos: .utility))
    
    func getAllSevices(lat:Double,lon:Double,completation: @escaping ((ServicesResponse) -> Void)) {
        
        provider.request(.getAllServices(lat: lat, lon: lon)) { result in
            switch(result) {
            case .success(let response):
                DispatchQueue.main.async {
                    do {
                        if response.statusCode == AppConstant.API.Codes.success.rawValue {
                            let responseModel: ServicesApiResponseModel = try response.map(ServicesApiResponseModel.self)
                            // CacheData
                            
                            completation((nil,responseModel.data!))
                        } else {
                            completation((HomeConstant.HomeError.InvalidURL,[DataModel]()))
                        }
                    } catch{
                        completation((HomeConstant.HomeError.ParsingError,[DataModel]()))
                    }
                }
            case .failure(_):
                DispatchQueue.main.async {
                    completation((HomeConstant.HomeError.InvalidURL,[DataModel]()))
                }
            }
        }
    }
    
    func saveCachedItems(categories: [DataModel])  {
        CacheHandler.SaveData(categories: categories)
    }
    
    func loadAllCachedData() -> ArrayOfCachedModule? {
        return CacheHandler.loadAllCachedData()
    }
    
}
