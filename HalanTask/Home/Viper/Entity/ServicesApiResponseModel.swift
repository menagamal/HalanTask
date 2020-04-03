//
//  ServicesApiResponseModel.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/3/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
class ServicesApiResponseModel :NSObject,NSCoding,Codable{
    let status : Int?
    let message : String?
    let data : [DataModel]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent([DataModel].self, forKey: .data)
    }
     required init?(coder aDecoder: NSCoder) {
        self.status = 0
        self.message = ""
        self.data = aDecoder.decodeObject(forKey: "DataModel") as! [DataModel]
        
    }
    
     func encode(with aCoder: NSCoder) {
        aCoder.encode(self.data, forKey: "DataModel")
    }
}
