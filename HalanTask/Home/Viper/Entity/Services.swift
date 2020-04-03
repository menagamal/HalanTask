//
//  Services.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
class Services : NSObject, Codable, NSCoding{
    var name : String?
    var pic : String?
    var id : String?
    var prefix : String?
    var vehicleType : String?
    var terms : String?
    var termsKey : String?
    var serviceType : String?
    var imageBase64:String!
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case pic = "pic"
        case id = "id"
        case prefix = "prefix"
        case vehicleType = "vehicleType"
        case terms = "terms"
        case termsKey = "termsKey"
        case serviceType = "serviceType"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        pic = try values.decodeIfPresent(String.self, forKey: .pic)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        prefix = try values.decodeIfPresent(String.self, forKey: .prefix)
        vehicleType = try values.decodeIfPresent(String.self, forKey: .vehicleType)
        terms = try values.decodeIfPresent(String.self, forKey: .terms)
        termsKey = try values.decodeIfPresent(String.self, forKey: .termsKey)
        serviceType = try values.decodeIfPresent(String.self, forKey: .serviceType)
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init()
        
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.id = aDecoder.decodeObject(forKey: "id") as? String
        self.vehicleType = aDecoder.decodeObject(forKey: "serviceType") as? String
        self.terms = aDecoder.decodeObject(forKey: "terms") as? String
        self.termsKey = aDecoder.decodeObject(forKey: "termsKey") as? String
        self.serviceType = aDecoder.decodeObject(forKey: "serviceType") as? String
        self.imageBase64 = aDecoder.decodeObject(forKey: "imageBase64") as? String
        
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.vehicleType, forKey: "vehicleType")
        aCoder.encode(self.terms, forKey: "terms")
        aCoder.encode(self.termsKey, forKey: "termsKey")
        aCoder.encode(self.serviceType, forKey: "serviceType")
        aCoder.encode(self.imageBase64, forKey: "imageBase64")
        
    }
}
