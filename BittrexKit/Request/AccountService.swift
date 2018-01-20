//
//  AccountService.swift
//  Bittrex
//
//  Created by yuzushioh on 2017/12/29.
//  Copyright © 2017 yuzushioh. All rights reserved.
//

import APIKit

public final class AccountService {
    public struct GetBalances: BittrexRequest {
        public typealias Response = GetBalancesResponse
        
        public init() {}
        
        public var path: String {
            return "/account/getbalances"
        }
        
        public var withAuth: Bool {
            return true
        }
    }
    
    public struct GetBalance: BittrexRequest {
        public typealias Response = GetBalanceResponse
        
        public let currency: String
        
        public init(currency: String) {
            self.currency = currency
        }
        
        public var path: String {
            return "/account/getbalance"
        }
        
        public var parameters: Any? {
            return ["currency": currency]
        }
        
        public var withAuth: Bool {
            return true
        }
    }
    
    public struct GetDepositAddress: BittrexRequest {
        public typealias Response = GetDepositAddressResponse
        
        public let currency: String
        
        public init(currency: String) {
            self.currency = currency
        }
        
        public var path: String {
            return "/account/getdepositaddress"
        }
        
        public var parameters: Any? {
            return ["currency": currency]
        }
        
        public var withAuth: Bool {
            return true
        }
    }
    
    public struct Withdraw: BittrexRequest {
        public typealias Response = WithdrawResponse
        
        public let currency: String
        public let quantity: Double
        public let address: String
        
        public init(currency: String, quantity: Double, address: String) {
            self.currency = currency
            self.quantity = quantity
            self.address = address
        }
        
        public var path: String {
            return "/account/withdraw"
        }
        
        public var parameters: Any? {
            return ["currency": currency, "quantity": quantity, "address": address]
        }
        
        public var withAuth: Bool {
            return true
        }
    }
}

public struct GetBalancesResponse: Decodable {
    public let message: String
    public let balances: [Balance]
    public let success: Bool
    
    public enum CodingKeys: String, CodingKey {
        case balances = "result"
        case message
        case success
    }
}

public struct GetBalanceResponse: Decodable {
    public let message: String
    public let balance: Balance?
    public let success: Bool
    
    public enum CodingKeys: String, CodingKey {
        case balance = "result"
        case message
        case success
    }
}

public struct GetDepositAddressResponse: Decodable {
    let message: String
    let address: Address?
    let success: Bool
    
    enum CodingKeys: String, CodingKey {
        case address = "result"
        case message
        case success
    }
}

public struct WithdrawResponse: Decodable {
    public let uuid: String
    public let message: String
    public let success: Bool
    
    public enum CodingKeys: String, CodingKey {
        case uuid = "result"
        case message
        case success
    }
}
