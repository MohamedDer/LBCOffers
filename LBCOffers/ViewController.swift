//
//  ViewController.swift
//  LBCOffers
//
//  Created by Mohamed Derkaoui on 12/04/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        ArticelsService.shared.fetchArticles { (articles, error) in
            if let articles = articles {
                self.articles = articles
            }
        }
        
    }


}

