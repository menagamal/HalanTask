//
//  DetailsViewController.swift
//  HalanTask
//
//  Created by Mena Gamal on 4/3/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController ,DetailsView{

    @IBOutlet weak var labelTitle: UILabel!
    
    var presenter:DetailsPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.tintColor = UIColor.white
        presenter.loadData()
    }



}
