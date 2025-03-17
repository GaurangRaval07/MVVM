//
//  Login Model.swift
//  MVVM Demo
//
//  Created by Gauarang Raval on 13/03/25.
//

import Foundation

struct Comment: Decodable {
    let postId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let body: String?
}
