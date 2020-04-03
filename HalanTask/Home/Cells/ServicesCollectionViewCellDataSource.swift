//
//  ServicesCollectionViewCellDataSource.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/3/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//



import Foundation
import UIKit

class ServicesCollectionViewCellDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    
    
    var services: [Services] = [Services]()
    var collection:UICollectionView!
    var delegate:ServicesDataSourceActions!
    
    override init() {
        super.init()
    }
    
    init(collection:UICollectionView,services:[Services],delegate:ServicesDataSourceActions) {
        super.init()
        
        self.collection = collection
        
        self.services = services
        
        self.collection.register(UINib(nibName: "ServicesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ServicesCollectionViewCell")
        
        
        self.collection.dataSource = self
        
        self.collection.delegate = self
        
        self.delegate = delegate
        
        self.collection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCollectionViewCell",for: indexPath) as! ServicesCollectionViewCell
        cell.setDetails(service: services[indexPath.row], completation: { img in
            let imageData = img.pngData()
            let imageToBaseStr = imageData!.base64EncodedString(options: .lineLength76Characters)
            self.services[indexPath.row].imageBase64 = imageToBaseStr
            if indexPath.row == self.services.count - 1 {
                self.delegate.shouldCache()
            }
        })
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = services[indexPath.row]
        self.delegate.didSelectServices(services: item)
    }
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 5
        let width = collectionView.frame.size.width/2 - padding
        let height = collectionView.frame.size.height - padding
        return CGSize(width: width, height: height)
        
    }
}


protocol ServicesDataSourceActions {
    func didSelectServices(services:Services)
    func shouldCache()
}
