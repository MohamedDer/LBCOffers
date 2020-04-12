//
//  ArticlesService.swift
//  LBCOffers
//
//  Created by Mohamed Derkaoui on 12/04/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import Foundation


class ArticelsService: NetworkServiceProtocol {
    
    public static let shared = ArticelsService()
    
    var _baseUrlString = "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json"
    var baseUrlString: String {
        get {
            return _baseUrlString
        }
        set {
            _baseUrlString = newValue
        }
    }
    
    
    func fetchData( completion: @escaping (_ responseArray: [Decodable]?, _ error: Error?) -> () ) {
        if let url = URL(string: baseUrlString){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    return completion(nil, error)
                }
                do {
                    let responseArticles = try JSONDecoder().decode([Article].self, from: data)
                    completion(responseArticles, nil)
                } catch{
                    completion(nil, error)
                }
            }.resume()
        }
    }

}
