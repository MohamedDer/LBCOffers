//
//  NetworkService.swift
//  LBCOffers
//
//  Created by Mohamed Derkaoui on 12/04/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol: class {
    
    var baseUrlString: String { get set }
    
    func fetchData(completion: @escaping (_ responseArray: [Decodable]?, _ error: NSError?) -> ())
    
}
