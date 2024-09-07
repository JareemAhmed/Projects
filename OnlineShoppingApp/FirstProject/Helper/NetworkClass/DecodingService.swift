//
//  DecodingService.swift
//  FirstProject
//
//  Created by TeamX Tec on 04/06/2024.
//

import Foundation

class DecodingService{
    static func decodeJSON<T: Decodable>(data: Data? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        guard let data = data else { return }
        do {
          let decodedObject = try JSONDecoder().decode(T.self, from: data)
          completion(.success(decodedObject))
        } catch {
          completion(.failure(error))
        }
      }
}
