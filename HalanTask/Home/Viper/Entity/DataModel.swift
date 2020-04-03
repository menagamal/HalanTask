//
//  Data.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
class DataModel : NSObject, Codable, NSCoding {
    var naming : String?
    var pic : String?
    var prefix : String?
    var services : [Services]?
    var imageBase64:String!
    
    enum CodingKeys: String, CodingKey {

        case naming = "naming"
        case pic = "pic"
        case prefix = "prefix"
        case services = "services"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        naming = try values.decodeIfPresent(String.self, forKey: .naming)
        pic = try values.decodeIfPresent(String.self, forKey: .pic)
        prefix = try values.decodeIfPresent(String.self, forKey: .prefix)
        services = try values.decodeIfPresent([Services].self, forKey: .services)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init()
        self.pic = ""
        self.prefix = ""
        self.naming = aDecoder.decodeObject(forKey: "naming") as? String
        self.imageBase64 = aDecoder.decodeObject(forKey: "imageBase64") as? String
        self.services = aDecoder.decodeObject(forKey: "services") as? [Services]
        
    }
    
    open func encode(with aCoder: NSCoder) {
        aCoder.encode(self.imageBase64, forKey: "imageBase64")
        aCoder.encode(self.naming, forKey: "naming")
        aCoder.encode(self.services, forKey: "services")
        
    }

}
