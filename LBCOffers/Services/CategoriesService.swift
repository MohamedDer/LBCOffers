//
//  CategoriesService.swift
//  LBCOffers
//
//  Created by Mohamed Derkaoui on 12/04/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import Foundation

class CategoriesService {
    
    public static let shared = CategoriesService()

    private let baseCategoriesUrl = "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json"


    func fetchCategories( completion: @escaping (_ categories: [Category]?, _ error: Error?) -> () ) {
        if let url = URL(string: baseCategoriesUrl){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    return completion(nil, error)
                }
                do {
                    let reponseCategories = try JSONDecoder().decode([Category].self, from: data)
                    completion(reponseCategories, nil)
                } catch{
                    completion(nil, error)
                }
            }.resume()
        }
    }
}

