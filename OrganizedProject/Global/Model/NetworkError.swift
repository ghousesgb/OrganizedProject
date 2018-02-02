//
//  NetworkError.swift
//  OrganizedProject
//
//  Created by Ghouse Basha Shaik on 01/02/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import Foundation
struct NetworkError: Codable {
    let Message: String?
}
extension NetworkError {
    init(data: Data) throws {
        self = try JSONDecoder().decode(NetworkError.self, from: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}
