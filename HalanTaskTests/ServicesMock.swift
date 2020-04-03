//
//  ServicesMock.swift
//  HalanTaskTests
//
//  Created by Mena Gamal on 4/3/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

@testable import HalanTask


class HomeInteractorMock: HomeUseCase {
    func getAllSevices(lat: Double, lon: Double, completation: @escaping ((ServicesResponse) -> Void)) {
        let temp = HomeTarget.getAllServices(lat: lat, lon: lon).sampleData
        do {
            let responseModel: ServicesApiResponseModel = try JSONDecoder().decode(ServicesApiResponseModel.self, from: temp)
            
            completation((nil,responseModel.data!))
        } catch {
            completation((HomeConstant.HomeError.ParsingError,[DataModel]()))
        }
    }
}
