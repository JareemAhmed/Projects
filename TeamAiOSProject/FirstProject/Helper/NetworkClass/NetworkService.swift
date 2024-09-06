//
//  NetworkService.swift
//  FirstProject
//
//  Created by TeamX Tec on 04/06/2024.
//

import Foundation
import UIKit

class NetworkService {
    
  static func getProducts(completion: @escaping (Result<GetAllProducts, Error>) -> Void) {
      NetworkManager.fetchData(urlString: NetworkConstant.shared.getProducts, completion: completion)
  }
    
}

