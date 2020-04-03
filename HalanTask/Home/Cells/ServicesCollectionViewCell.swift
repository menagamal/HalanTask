//
//  ServicesCollectionViewCell.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/2/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit
import SDWebImage

class ServicesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()    
    }
    
    
    
    func setDetails(service:Services,completation:@escaping((_ image:UIImage)->Void))  {
        labelTitle.text = service.name
        if service.imageBase64 != nil {
            
            let dataDecoded : Data = Data(base64Encoded: service.imageBase64!, options: .ignoreUnknownCharacters)!
            let decodedimage:UIImage = UIImage(data: dataDecoded)!
            self.mainImageView.image = decodedimage
            
        } else if let url = service.pic {
            let finalUrl = url + service.prefix! + ".png"
            mainImageView.sd_setImage(with: URL(string: finalUrl)!) { (img, err, typ, ur) in
                if img != nil {
                    completation(img!)
                }
                
            }
        }
        
    }
}
