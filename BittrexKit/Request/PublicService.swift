//
//  PublicService.swift
//  Bittrex
//
//  Created by yuzushioh on 2017/12/29.
//  Copyright © 2017 yuzushioh. All rights reserved.
//

import APIKit

public final class PublicService {
    public struct GetMarkets: BittrexRequest {
        public typealias Response = GetMarketsResponse
        
        public var path: String {
            return "/public/getmarkets"
        }
        
        public var withAuth: Bool {
            return false
        }
    }
    
    public struct GetCurrencies: BittrexRequest {
        public typealias Response = GetCurrenciesResponse
        
        public var path: String {
            return "/public/getcurrencies"
        }
        
        public var withAuth: Bool {
            return false
        }
    }
    
    public struct GetTicker: BittrexRequest {
        public typealias Response = GetTickerResponse
        
        public let market: String
        
        public var path: String {
            return "/public/getticker"
        }
        
        public var parameters: Any? {
            return ["market": market]
        }
        
        public var withAuth: Bool {
            return false
        }
    }
    
    public struct GetMarketSummaries: BittrexRequest {
        public typealias Response = GetMarketSummariesResponse
        
        public var path: String {
            return "/public/getmarketsummaries"
        }
        
        public var withAuth: Bool {
            return false
        }
    }
    
    public struct GetMarketSummary: BittrexRequest {
        public typealias Response = GetMarketSummaryResponse
        
        public let market: String
        
        public var path: String {
            return "/public/getmarketsummary"
        }
        
        public var parameters: Any? {
            return ["market": market]
        }
        
        public var withAuth: Bool {
            return false
        }
    }
    
    public struct GetOrderBook: BittrexRequest {
        public typealias Response = GetOrderBookResponse
        
        public let market: String
        
        public var path: String {
            return "/public/getorderbook"
        }
        
        public var parameters: Any? {
            return ["market": market, "type": "both"]
        }
        
        public var withAuth: Bool {
            return false
        }
    }
    
    public struct GetSellOrders: BittrexRequest {
        public typealias Response = GetOrdersResponse
        
        public let market: String
        
        public var path: String {
            return "/public/getorderbook"
        }
        
        public var parameters: Any? {
            return ["market": market, "type": "sell"]
        }
        
        public var withAuth: Bool {
            return false
        }
    }
    
    public struct GetBuyOrders: BittrexRequest {
        public typealias Response = GetOrdersResponse
        
        public let market: String
        
        public var path: String {
            return "/public/getorderbook"
        }
        
        public var parameters: Any? {
            return ["market": market, "type": "buy"]
        }
        
        public var withAuth: Bool {
            return false
        }
    }
    
    public struct GetMarketHistory: BittrexRequest {
        public typealias Response = GetMarketHistoryResponse
        
        public let market: String
        
        public var path: String {
            return "/public/getmarkethistory"
        }
        
        public var parameters: Any? {
            return ["market": market]
        }
        
        public var withAuth: Bool {
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
