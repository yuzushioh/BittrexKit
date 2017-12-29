//
//  AccountService.swift
//  Bittrex
//
//  Created by yuzushioh on 2017/12/29.
//  Copyright © 2017 yuzushioh. All rights reserved.
//

import APIKit

final class AccountService {
    struct GetBalances: BittrexRequest {
        typealias Response = GetBalancesResponse
        
        let apiKey: String
        let nonce: String
        
        var path: String {
            return "/account/getbalances"
        }
        
        var parameters: Any? {
            return ["apikey": apiKey, "nonce": nonce]
        }
        
        var withAuth: Bool {
            return true
        }
    }
    
    struct GetBalance: BittrexRequest {
        typealias Response = GetBalanceResponse
        
        let currency: String
        let apiKey: String
        let nonce: String
        
        var path: String {
            return "/account/getbalance"
        }
        
        var parameters: Any? {
            return ["apikey": apiKey, "nonce": nonce, "currency": currency]
        }
        
        var withAuth: Bool {
            return true
        }
    }
    
    struct GetDepositAddress: BittrexRequest {
        typealias Response = GetDepositAddressResponse
        
        let currency: String
        let apiKey: String
        let nonce: String
        
        var path: String {
            return "/account/getdepositaddress"
        }
        
        var parameters: Any? {
            return ["apikey": apiKey, "nonce": nonce, "currency": currency]
        }
        
        var withAuth: Bool {
            return true
        }
    }
    
    struct Withdraw: BittrexRequest {
        typealias Response = WithdrawResponse
        
        let currency: String
        let quantity: Double
        let address: String
        let apiKey: String
        let nonce: String
        
        var path: String {
            return "/account/withdraw"
        }
        
        var parameters: Any? {
            return [
                "apikey": apiKey,
                "nonce": nonce,
                "currency": currency,
                "quantity": quantity,
                "address": address
            ]
        }
        
        var withAuth: Bool {
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
