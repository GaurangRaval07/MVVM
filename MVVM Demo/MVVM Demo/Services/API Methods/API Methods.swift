//
//  API Methods.swift
//  MVVM Demo
//
//  Created by Gauarang Raval on 17/03/25.
//

import Foundation

enum HTTPMethod: String {
    case GET     = "GET"
    case POST    = "POST"
    case PUT     = "PUT"
    case DELETE  = "DELETE"
    case PATCH   = "PATCH"
}

enum APIError: Error {
    case invalidURL
    case noData
}
