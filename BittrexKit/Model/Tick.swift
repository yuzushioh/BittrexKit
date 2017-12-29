//
//  Tick.swift
//  Bittrex
//
//  Created by yuzushioh on 2017/12/29.
//  Copyright © 2017 yuzushioh. All rights reserved.
//

import Foundation

public struct Tick: Decodable {
    public let bid: Double
    public let ask: Double
    public let last: Double
    
    public enum CodingKeys: String, CodingKey {
        case bid = "Bid"
        case ask = "Ask"
        case last = "Last"
    }
}
