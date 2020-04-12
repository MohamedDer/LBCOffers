//
//  ArticlesService.swift
//  LBCOffers
//
//  Created by Mohamed Derkaoui on 12/04/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import Foundation


class ArticelsService {
    
    public static let shared = ArticelsService()
    
    private let baseListingUrl = "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json"

    
    func fetchArticles( completion: @escaping (_ articels: [Article]?, _ error: Error?) -> () ) {
        if let url = URL(string: baseListingUrl){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    return completion(nil, error)
                }
                do {
                    let responseArticels = try JSONDecoder().decode([Article].self, from: data)
                    completion(responseArticels, nil)
                } catch{
                    completion(nil, error)
                }
            }.resume()
        }
    }

}
