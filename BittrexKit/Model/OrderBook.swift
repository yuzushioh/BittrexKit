//
//  OrderBook.swift
//  Bittrex
//
//  Created by yuzushioh on 2017/12/29.
//  Copyright © 2017 yuzushioh. All rights reserved.
//

import Foundation

public struct OrderBook: Decodable {
    public struct Order: Decodable {
        public let quantity: Double
        public let rate: Double
        
        public enum CodingKeys: String, CodingKey {
            case quantity = "Quantity"
            case rate = "Rate"
        }
    }
    
    public let buy: [Order]
    public let sell: [Order]
}
