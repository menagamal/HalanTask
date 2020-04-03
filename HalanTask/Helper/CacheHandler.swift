//
//  CacheHandler.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/3/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import DataCache

class CacheHandler {
    
    static func SaveData(categories:[DataModel])  {
        
        
        let newArrayOfObjects = ArrayOfCachedModule()
        
        newArrayOfObjects.modules = categories
        
        DataCache.instance.write(object: newArrayOfObjects, forKey: HomeConstant.Keys.cachedItems)
        
    }
    
    static  func loadAllCachedData() -> ArrayOfCachedModule? {
        if let data = DataCache.instance.readData(forKey: HomeConstant.Keys.cachedItems)  {
            if let obj = NSKeyedUnarchiver.unarchiveObject(with: data) as? ArrayOfCachedModule {
                return obj
            } else {
                return nil
            }
            
        } else {
            return nil
        }
    }
    
    
}
