//
//  PoliciesNetworking.swift
//  OrganizedProject
//
//  Created by Ghouse Basha Shaik on 30/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import Foundation

class PoliciesNetworking {
    var allPolicies = [PolicyInfo]()
    var isValidResponse = false
    var message: String?
   
    func getPolicies(completion : @escaping ()->Void) {
        let policyRequest = APIRequest()
        policyRequest.urlString = BASE_URL + "GetPoliciesInfo"
        policyRequest.httpMethod = "GET"
        policyRequest.headers = ["id" : "5" as AnyObject]
        
        NewtworkManager.shared.makeAPICalls(apiRequest: policyRequest) { (data, response, error) in
            
            if let response = response {
                guard error == nil else {
                    self.message = "response, error"
                    return
                }
                if response.getStatusCode()! >= 200 && response.getStatusCode()! < 300 {
                    do {
                        let allPolicies = try AllPolices.init(data: data!)
                        self.isValidResponse = true
                        self.allPolicies = (allPolicies.policyInfo)!
                    }catch {
                        self.message = "all policies conversion failed"
                    }
                }else {
                    do{
                        let messageObj = try NetworkError.init(data: data!) //.jsonString()
                        self.message = messageObj.Message
                    }catch {
                        self.message = "jsonString conversion issue"
                    }
                }
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return allPolicies.count
    }
    func cellForRowAt(indexPath: IndexPath) -> PolicyInfo {
        return allPolicies[indexPath.row]
    }
}
