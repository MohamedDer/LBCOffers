//
//  ArticlesService.swift
//  LBCOffers
//
//  Created by Mohamed Derkaoui on 12/04/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import Foundation


class ArticlesService: NetworkServiceProtocol {
    
    public static let shared = ArticlesService()
    
    var _baseUrlString = "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json"
    var baseUrlString: String {
        get {
            return _baseUrlString
        }
        set {
            _baseUrlString = newValue
        }
    }
    
    
    func fetchData( completion: @escaping (_ responseArray: [Decodable]?, _ error: NSError?) -> () ) {
        if let url = URL(string: baseUrlString){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    return completion(nil, NSError(domain: "InvalidURLSession", code: 0, userInfo: nil))
                }
                do {
                    let responseArticles = try JSONDecoder().decode([Article].self, from: data)
                    completion(responseArticles, nil)
                } catch{
                    completion(nil, NSError(domain: "InvalidDataFormat", code: 0, userInfo: nil))
                }
            }.resume()
        }
    }

}
