//
//  PublicService.swift
//  Bittrex
//
//  Created by yuzushioh on 2017/12/29.
//  Copyright © 2017 yuzushioh. All rights reserved.
//

import APIKit

final class PublicService {
    struct GetMarkets: BittrexRequest {
        typealias Response = GetMarketsResponse
        
        var path: String {
            return "/public/getmarkets"
        }
        
        var withAuth: Bool {
            return false
        }
    }
    
    struct GetCurrencies: BittrexRequest {
        typealias Response = GetCurrenciesResponse
        
        var path: String {
            return "/public/getcurrencies"
        }
        
        var withAuth: Bool {
            return false
        }
    }
    
    struct GetTicker: BittrexRequest {
        typealias Response = GetTickerResponse
        
        let market: String
        
        var path: String {
            return "/public/getticker"
        }
        
        var parameters: Any? {
            return ["market": market]
        }
        
        var withAuth: Bool {
            return false
        }
    }
    
    struct GetMarketSummaries: BittrexRequest {
        typealias Response = GetMarketSummariesResponse
        
        var path: String {
            return "/public/getmarketsummaries"
        }
        
        var withAuth: Bool {
            return false
        }
    }
    
    struct GetMarketSummary: BittrexRequest {
        typealias Response = GetMarketSummaryResponse
        
        let market: String
        
        var path: String {
            return "/public/getmarketsummary"
        }
        
        var parameters: Any? {
            return ["market": market]
        }
        
        var withAuth: Bool {
            return false
        }
    }
    
    struct GetOrderBook: BittrexRequest {
        typealias Response = GetOrderBookResponse
        
        let market: String
        
        var path: String {
            return "/public/getorderbook"
        }
        
        var parameters: Any? {
            return ["market": market, "type": "both"]
        }
        
        var withAuth: Bool {
            return false
        }
    }
    
    struct GetSellOrders: BittrexRequest {
        typealias Response = GetOrdersResponse
        
        let market: String
        
        var path: String {
            return "/public/getorderbook"
        }
        
        var parameters: Any? {
            return ["market": market, "type": "sell"]
        }
        
        var withAuth: Bool {
            return false
        }
    }
    
    struct GetBuyOrders: BittrexRequest {
        typealias Response = GetOrdersResponse
        
        let market: String
        
        var path: String {
            return "/public/getorderbook"
        }
        
        var parameters: Any? {
            return ["market": market, "type": "buy"]
        }
        
        var withAuth: Bool {
            return false
        }
    }
    
    struct GetMarketHistory: BittrexRequest {
        typealias Response = GetMarketHistoryResponse
        
        let market: String
        
        var path: String {
            return "/public/getmarkethistory"
        }
        
        var parameters: Any? {
            return ["market": market]
        }
        
        var withAuth: Bool {
            return false
        }
    }
}

public struct GetMarketsResponse: Decodable {
    public let message: String
    public let markets: [Market]
    public let success: Bool
    
    public enum CodingKeys: String, CodingKey {
        case message
        case markets = "result"
        case success
    }
}

public struct GetCurrenciesResponse: Decodable {
    public let message: String
    public let currencies: [Currency]
    public let success: Bool
    
    public enum CodingKeys: String, CodingKey {
        case message
        case currencies = "result"
        case success
    }
}

public struct GetTickerResponse: Decodable {
    public let message: String
    public let tick: Tick
    public let success: Bool
    
    public enum CodingKeys: String, CodingKey {
        case message
        case tick = "result"
        case success
    }
}

public struct GetMarketSummariesResponse: Decodable {
    public let message: String
    public let marketSummaries: [MarketSummary]
    public let success: Bool
    
    public enum CodingKeys: String, CodingKey {
        case message
        case marketSummaries = "result"
        case success
    }
}

public struct GetMarketSummaryResponse: Decodable {
    public let message: String
    public let marketSummaries: [MarketSummary]
    public let success: Bool
    
    public enum CodingKeys: String, CodingKey {
        case message
        case marketSummaries = "result"
        case success
    }
}

public struct GetOrderBookResponse: Decodable {
    public let message: String
    public let orderBook: OrderBook
    public let success: Bool
    
    public enum CodingKeys: String, CodingKey {
        case message
        case orderBook = "result"
        case success
    }
}

public struct GetOrdersResponse: Decodable {
    public let message: String
    public let orders: [OrderBook.Order]
    public let success: Bool
    
    public enum CodingKeys: String, CodingKey {
        case message
        case orders = "result"
        case success
    }
}

public struct GetMarketHistoryResponse: Decodable {
    public let message: String
    public let marketHistories: [MarketHistory]
    public let success: Bool
    
    public enum CodingKeys: String, CodingKey {
        case message
        case marketHistories = "result"
        case success
    }
}
