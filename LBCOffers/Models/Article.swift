//
//  Article.swift
//  LBCOffers
//
//  Created by Mohamed Derkaoui on 12/04/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import Foundation


struct Article: Decodable {
    
    var id: Int
    var category_id: Int
    var title: String
    var description: String
    var price: Double
    var images_url: Image
    var creation_date: String
    var is_urgent: Bool
    
}
