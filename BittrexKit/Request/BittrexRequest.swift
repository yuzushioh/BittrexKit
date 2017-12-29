//
//  BittrexRequest.swift
//  Bittrex
//
//  Created by yuzushioh on 2017/12/29.
//  Copyright © 2017 yuzushioh. All rights reserved.
//

import Foundation
import APIKit
import Crypto

protocol BittrexRequest: APIKit.Request {
    var withAuth: Bool { get }
}

extension BittrexRequest {
    private var url: URL {
        return URL(string: "https://bittrex.com")!
    }
    
    private var apiVersion: String {
        return "v1.1"
    }
    
    var baseURL: URL {
        return url
            .appendingPathComponent("/api")
            .appendingPathComponent("/\(apiVersion)")
    }
    
    var method: HTTPMethod {
        return .get
    }
}

extension BittrexRequest where Response: Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        let data = try JSONSerialization.data(withJSONObject: object, options: [])
        return try JSONDecoder().decode(Response.self, from: data)
    }
}
