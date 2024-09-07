//
//  NetworkConstant.swift
//  FirstProject
//
//  Created by TeamX Tec on 04/06/2024.
//

import Foundation


class NetworkConstant{
    
    static var shared = NetworkConstant()
    var baseUrl = "https://dummyjson.com/"
     var getProducts : String{
        return baseUrl + "products"
    }
}
