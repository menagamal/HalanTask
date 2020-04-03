//
//  CategoryView.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class CategoryView: UIView ,ServicesDataSourceActions{
    
    
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var labelCategoryTitle: UILabel!
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    @IBOutlet weak var CategoryHeight: NSLayoutConstraint!
    
    var dataSource:ServicesCollectionViewCellDataSource!
    var delegate:CategoryViewDelegate!
    var didCache = false
    func setDetails(model:DataModel,delegate:CategoryViewDelegate,completation:@escaping((_ image:UIImage)->Void))  {
        labelCategoryTitle.text = model.naming
        self.delegate = delegate
        dataSource = ServicesCollectionViewCellDataSource(collection: self.servicesCollectionView, services: model.services!, delegate: self)
        let bounds = UIScreen.main.bounds
        
        let height = bounds.size.height
        self.CategoryHeight.constant = height/2.5
        self.CategoryHeight.isActive = true
        
        if model.imageBase64 != nil {
            
            let dataDecoded : Data = Data(base64Encoded: model.imageBase64!, options: .ignoreUnknownCharacters)!
            let decodedimage:UIImage = UIImage(data: dataDecoded)!
            self.categoryImageView.image = decodedimage
            
        } else if let url = model.pic {
            let finalUrl = url + model.prefix! + ".png"
            categoryImageView.sd_setImage(with: URL(string: finalUrl)!) { (img, err, typ, ur) in
                if img != nil {
                    completation(img!)
                }
                
            }
        }
        
    }
    
    func didSelectServices(services: Services) {
        self.delegate.didSelect(services: services)
        
    }
    
    func shouldCache() {
        self.delegate.shouldCache()
    }
}

protocol CategoryViewDelegate {
    func didSelect(services: Services)
    func shouldCache()
}
