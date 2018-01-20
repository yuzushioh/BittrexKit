//
//  Market.swift
//  Bittrex
//
//  Created by yuzushioh on 2017/12/29.
//  Copyright © 2017 yuzushioh. All rights reserved.
//

import Foundation

public struct Market: Decodable {
    public let marketCurrency: String
    public let baseCurrency: String
    public let marketCurrencyLong: String
    public let baseCurrencyLong: String
    public let logoURL: URL?
    public let minTradeSize: Double
    public let marketName: String
    public let isActive: Bool
    
    public enum CodingKeys: String, CodingKey {
        case marketCurrency = "MarketCurrency"
        case baseCurrency = "BaseCurrency"
        case marketCurrencyLong = "MarketCurrencyLong"
        case baseCurrencyLong = "BaseCurrencyLong"
        case logoURL = "LogoUrl"
        case minTradeSize = "MinTradeSize"
        case marketName = "MarketName"
        case isActive = "IsActive"
    }
}
