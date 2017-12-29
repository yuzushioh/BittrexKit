//
//  MarketService.swift
//  Bittrex
//
//  Created by yuzushioh on 2017/12/30.
//  Copyright © 2017 yuzushioh. All rights reserved.
//

import APIKit

final class MarketService {
    struct BuyLimit: BittrexRequest {
        typealias Response = BuySellLimitResponse
        
        let market: String
        let quantity: Double
        let rate: Double
        let apiKey: String
        let nonce: String
        
        var path: String {
            return "/market/buylimit"
        }
        
        var parameters: Any? {
            return ["market": market, "quantity": quantity, "rate": rate, "apikey": apiKey, "nonce": nonce]
        }
        
        var withAuth: Bool {
            return true
        }
    }
    
    struct SellLimit: BittrexRequest {
        typealias Response = BuySellLimitResponse
        
        let market: String
        let quantity: Double
        let rate: Double
        let apiKey: String
        let nonce: String
        
        var path: String {
            return "/market/selllimit"
        }
        
        var parameters: Any? {
            return ["market": market, "quantity": quantity, "rate": rate, "apikey": apiKey, "nonce": nonce]
        }
        
        var withAuth: Bool {
            return true
        }
    }
    
    struct Cancel: BittrexRequest {
        typealias Response = CancelResponse
        
        let uuid: String
        let apiKey: String
        let nonce: String
        
        var path: String {
            return "/market/cancel"
        }
        
        var parameters: Any? {
            return ["uuid": uuid, "apikey": apiKey, "nonce": nonce]
        }
        
        var withAuth: Bool {
            return true
        }
    }
    
    struct GetOpenOrders: BittrexRequest {
        typealias Response = GetOpenOrdersResponse
        
        let market: String
        let apiKey: String
        let nonce: String
        
        var path: String {
            return "/market/getopenorders"
        }
        
        var parameters: Any? {
            return ["market": market, "apikey": apiKey, "nonce": nonce]
        }
        
        var withAuth: Bool {
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
