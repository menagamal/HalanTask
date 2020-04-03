//
//  CacheModule.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/3/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
open class ArrayOfCachedModule:NSObject,NSCoding {
    var modules = [DataModel]()
    
    public override init() {
        super.init()
    }
    public required init?(coder aDecoder: NSCoder) {
        
        self.modules = aDecoder.decodeObject(forKey: "CachedModule") as! [DataModel]
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.modules, forKey: "CachedModule")
    }
}
