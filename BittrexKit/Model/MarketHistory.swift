//
//  MarketHistory.swift
//  Bittrex
//
//  Created by yuzushioh on 2017/12/29.
//  Copyright © 2017 yuzushioh. All rights reserved.
//

import Foundation

public struct MarketHistory: Decodable {
    public let id: Int64
    public let quantity: Double
    public let price: Double
    public let total: Double
    public let fillType: String
    public let orderType: String
    
    public enum CodingKeys: String, CodingKey {
        case id = "Id"
        case quantity = "Quantity"
        case price = "Price"
        case total = "Total"
        case fillType = "FillType"
        case orderType = "OrderType"
    }
}
