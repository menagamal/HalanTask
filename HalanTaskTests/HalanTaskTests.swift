//
//  HalanTaskTests.swift
//  HalanTaskTests
//
//  Created by Mena Gamal on 4/3/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import XCTest

class HalanTaskTests: XCTestCase {
    var homeInteractor:HomeInteractorMock!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        homeInteractor = HomeInteractorMock()

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    
    func testGetAllServices()  {
        homeInteractor.getAllSevices(lat: 31.022, lon: 31.022){ (result) in
            
            XCTAssertNotNil(result.1)
            XCTAssertNil(result.0)
            if result.1.isEmpty {
                XCTFail()
            }
        }
    }
    
}
