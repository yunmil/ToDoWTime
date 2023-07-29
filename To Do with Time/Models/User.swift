//
//  User.swift
//  To Do with Time
//
//  Created by Yunmi Lee on 6/25/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
