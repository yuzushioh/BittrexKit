//
//  MarketService.swift
//  Bittrex
//
//  Created by yuzushioh on 2017/12/30.
//  Copyright © 2017 yuzushioh. All rights reserved.
//

import APIKit

public final class MarketService {
    public struct BuyLimit: BittrexRequest {
        public typealias Response = BuySellLimitResponse
        
        public let market: String
        public let quantity: Double
        public let rate: Double
        public let apiKey: String
        public let nonce: String
        
        public var path: String {
            return "/market/buylimit"
        }
        
        public var parameters: Any? {
            return ["market": market, "quantity": quantity, "rate": rate, "apikey": apiKey, "nonce": nonce]
        }
        
        public var withAuth: Bool {
            return true
        }
    }
    
    public struct SellLimit: BittrexRequest {
        public typealias Response = BuySellLimitResponse
        
        public let market: String
        public let quantity: Double
        public let rate: Double
        public let apiKey: String
        public let nonce: String
        
        public var path: String {
            return "/market/selllimit"
        }
        
        public var parameters: Any? {
            return ["market": market, "quantity": quantity, "rate": rate, "apikey": apiKey, "nonce": nonce]
        }
        
        public var withAuth: Bool {
            return true
        }
    }
    
    public struct Cancel: BittrexRequest {
        public typealias Response = CancelResponse
        
        public let uuid: String
        public let apiKey: String
        public let nonce: String
        
        public var path: String {
            return "/market/cancel"
        }
        
        public var parameters: Any? {
            return ["uuid": uuid, "apikey": apiKey, "nonce": nonce]
        }
        
        public var withAuth: Bool {
            return true
        }
    }
    
    public struct GetOpenOrders: BittrexRequest {
        public typealias Response = GetOpenOrdersResponse
        
        public let market: String
        public let apiKey: String
        public let nonce: String
        
        public var path: String {
            return "/market/getopenorders"
        }
        
        public var parameters: Any? {
            return ["market": market, "apikey": apiKey, "nonce": nonce]
        }
        
        public var withAuth: Bool {
            return true
        }
    }
}

public struct BuySellLimitResponse: Decodable {
    public let message: String
    public let uuid: String
    public let success: String
    
    public enum CodingKeys: String, CodingKey {
        case message
        case uuid = "result, uuid"
        case success
    }
}

public struct GetOpenOrdersResponse: Decodable {
    public let message: String
    public let openOrders: [OpenOrder]
    public let success: Bool
    
    public enum CodingKeys: String, CodingKey {
        case message
        case openOrders = "result"
        case success
    }
}

public struct CancelResponse: Decodable {
    public let message: String
    public let success: Bool
}
