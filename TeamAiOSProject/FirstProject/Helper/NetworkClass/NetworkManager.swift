//
//  NetworkManager.swift
//  FirstProject
//
//  Created by TeamX Tec on 04/06/2024.
//

import Foundation

class NetworkManager {
  static func fetchData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
    guard let url = URL(string: urlString) else { return }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = ApiType.GET.rawValue
    let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
      if let error = error {
        completion(.failure(error))
        return
      }
        DecodingService.decodeJSON(data: data ?? Data(), completion: completion)
    }
    task.resume()
  }
}
