//
//  API Manager.swift
//  MVVM Demo
//
//  Created by Gauarang Raval on 13/03/25.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    func reqauestData(url: String, method: HTTPMethod, parameter: [String: Any]? = nil, completion: @escaping(Result<Data, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if method == .POST || method == .PUT || method == .DELETE {
            do {
                if let parameter = parameter {
                    request.httpBody = try JSONSerialization.data(withJSONObject: parameter, options: [])
                }
            } catch {
                completion(.failure(error))
                return
            }
        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(APIError.noData))
            }
        }
        task.resume()
    }
}
