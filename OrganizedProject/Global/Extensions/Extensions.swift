//
//  Extensions.swift
//  OrganizedProject
//
//  Created by Ghouse Basha Shaik on 01/02/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import Foundation
extension URLResponse {
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
