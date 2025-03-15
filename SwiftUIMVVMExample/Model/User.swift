//
//  User.swift
//  SwiftUIMVVMExample
//
//  Created by Takeshi Kayahashi on 2025/03/13.
//

import Foundation

struct UsersResponse: Decodable {
    let users: [User]
}

struct UserResponse: Decodable {
    let user_id: String
    let name: String
    let comment: String
}

// ビジネスロジックにおける重要なオブジェクトを表現するためのクラスや構造体
struct User: Codable, Identifiable {
    
    let id: Int
    let name: String
    let comment: String
    
    init(from response: UserResponse) {
        self.id = Int(response.user_id) ?? 0
        self.name = response.name
        self.comment = response.comment
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "user_id" // JSONキーをマッピング
        case name
        case comment
    }

}
