//
//  HTTPRequest.swift
//  Bittrex
//
//  Created by yuzushioh on 2017/12/29.
//  Copyright © 2017 yuzushioh. All rights reserved.
//

import APIKit
import Crypto

struct HTTPRequest<Request: BittrexRequest>: APIKit.Request {
    private let baseRequest: Request
    private let auth: Auth
    
    init(_ baseRequest: Request, auth: Auth) {
        self.baseRequest = baseRequest
        self.auth = auth
    }
    
    var baseURL: URL {
        return baseRequest.baseURL
    }
    
    var path: String {
        return baseRequest.path
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: Any? {
        return baseRequest.parameters
    }
    
    var headerFields: [String: String] {
        guard let uri = buildURI(), baseRequest.withAuth else {
            return [:]
        }
        
        guard let sign = HMAC.sign(message: uri, algorithm: .sha512, key: auth.apiSecret) else {
            fatalError("Bittrex: HMAC failed")
        }
        
        return ["apisign": sign]
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Request.Response {
        return try baseRequest.response(from: object, urlResponse: urlResponse)
    }
    
    private func buildURI() -> String? {
        let url = path.isEmpty ? baseURL : baseURL.appendingPathComponent(path)
        
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return nil
        }
        
        if let queryParameters = queryParameters, !queryParameters.isEmpty {
            components.percentEncodedQuery = URLEncodedSerialization.string(from: queryParameters)
        }
        
        guard let uri = components.url?.absoluteString else {
            return nil
        }
        
        return uri
    }
}
