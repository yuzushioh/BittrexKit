//
//  OpenOrder.swift
//  Bittrex
//
//  Created by yuzushioh on 2017/12/29.
//  Copyright © 2017 yuzushioh. All rights reserved.
//

import Foundation

public struct OpenOrder: Decodable {
    public let uuid: String?
    public let orderUuid: String
    public let exchange: String
    public let orderType: String
    public let quantity: Double
    public let quantityRemaining: Double
    public let limit: Double
    public let commissionPaid: Double
    public let price: Double
    public let pricePerUnit: Double?
    public let cancelInitiated: Bool
    public let immediateOrCancel: Bool
    public let isConditional: Bool
    
    enum CodingKeys: String, CodingKey {
        case uuid = "Uuid"
        case orderUuid = "OrderUuid"
        case exchange = "Exchange"
        case orderType = "OrderType"
        case quantity = "Quantity"
        case quantityRemaining = "QuantityRemaining"
        case limit = "Limit"
        case commissionPaid = "CommissionPaid"
        case price = "Price"
        case pricePerUnit = "PricePerUnit"
        case cancelInitiated = "CancelInitiated"
        case immediateOrCancel = "ImmediateOrCancel"
        case isConditional = "IsConditional"
    }
}
