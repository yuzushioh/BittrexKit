//
//  Address.swift
//  Bittrex
//
//  Created by yuzushioh on 2017/12/29.
//  Copyright © 2017 yuzushioh. All rights reserved.
//

import Foundation

public struct Address: Decodable {
    public let currency: String
    public let address: String
    
    public enum CodingKeys: String, CodingKey {
        case currency = "Currency"
        case address = "Address"
    }
}
