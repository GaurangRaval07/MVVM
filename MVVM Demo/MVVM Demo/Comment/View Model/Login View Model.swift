//
//  Login View Model.swift
//  MVVM Demo
//
//  Created by Gauarang Raval on 13/03/25.
//

import Foundation

class PostViewModel {
    var comments: [Comment] = []
    var errorMsg: String?
    
    func fetchComments(completion: @escaping (Result<Bool, Error>) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/comments"
        APIManager.shared.reqauestData(url: url, method: .GET) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = try JSONDecoder().decode([Comment].self, from: data)
                    print("Response\(decoder)")
                    
                    self.comments = decoder
                    completion(.success(true))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
