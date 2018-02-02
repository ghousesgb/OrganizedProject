//
//  Policies.swift
//  OrganizedProject
//
//  Created by Ghouse Basha Shaik on 30/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import Foundation

struct AllPolices: Codable {
    let policyInfo: [PolicyInfo]?
    let counties: [String]?
    
    /*enum CodingKeys: String, CodingKey {
        case policyInfo = "policyInfo"
        case counties = "Counties"
    }*/
}

struct PolicyInfo: Codable {
    let id: Int?
    let inspectorid: Int?
    let policyno: String?
    let policytype: Int?
    let policytypename: String?
    let nameensured: String?
    let mailingaddress: String?
    let policyinsdate: String?
    let pryaddress: String?
    let deductible: String?
    let curcovgitemdes: JSONNull?
    let othcovgitemdes: JSONNull?
    let policyendorsements: JSONNull?
    let othendorsements: JSONNull?
    let liabilityexclusions: JSONNull?
    let claimshistory: JSONNull?
    let createddate: String?
    let longitude: String?
    let latitude: String?
    let status: Int?
    let inspectiondate: String?
    let inspectedEpochTime: Int?
    let agencyname: String?
    let policyCovgs: [PolicyCovg]?
    
   /* enum CodingKeys: String, CodingKey {
        case id = "id"
        case inspectorid = "inspectorid"
        case policyno = "policyno"
        case policytype = "policytype"
        case policytypename = "policytypename"
        case nameensured = "nameensured"
        case mailingaddress = "mailingaddress"
        case policyinsdate = "policyinsdate"
        case pryaddress = "pryaddress"
        case deductible = "deductible"
        case curcovgitemdes = "curcovgitemdes"
        case othcovgitemdes = "othcovgitemdes"
        case policyendorsements = "policyendorsements"
        case othendorsements = "othendorsements"
        case liabilityexclusions = "liabilityexclusions"
        case claimshistory = "claimshistory"
        case createddate = "createddate"
        case longitude = "longitude"
        case latitude = "latitude"
        case status = "status"
        case inspectiondate = "inspectiondate"
        case inspectedEpochTime = "InspectedEpochTime"
        case agencyname = "agencyname"
        case policyCovgs = "policyCovgs"
    }*/
}

struct PolicyCovg: Codable {
    let policycovgid: Int?
    let policyid: Int?
    let covgname: String?
    let covgvalue: String?
    let covgDescription: String?
    
   /* enum CodingKeys: String, CodingKey {
        case policycovgid = "policycovgid"
        case policyid = "policyid"
        case covgname = "covgname"
        case covgvalue = "covgvalue"
        case covgDescription = "covgDescription"
    }*/
}

// MARK: Convenience initializers

extension AllPolices {
    init(data: Data) throws {
        self = try JSONDecoder().decode(AllPolices.self, from: data)
    }
    
    init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

extension PolicyInfo {
    init(data: Data) throws {
        self = try JSONDecoder().decode(PolicyInfo.self, from: data)
    }
    
    init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

extension PolicyCovg {
    init(data: Data) throws {
        self = try JSONDecoder().decode(PolicyCovg.self, from: data)
    }
    
    init?(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else { return nil }
        try self.init(data: data)
    }
    
    init?(fromURL url: String) throws {
        guard let url = URL(string: url) else { return nil }
        let data = try Data(contentsOf: url)
        try self.init(data: data)
    }
    
    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString() throws -> String? {
        return String(data: try self.jsonData(), encoding: .utf8)
    }
}

// MARK: Encode/decode helpers

class JSONNull: Codable {
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

