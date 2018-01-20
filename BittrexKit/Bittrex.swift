//
//  Bittrex.swift
//  Bittrex
//
//  Created by yuzushioh on 2017/12/29.
//  Copyright © 2017 yuzushioh. All rights reserved.
//

import UIKit
import Result
import APIKit

public final class Bittrex {
    
    private let auth: Auth
    
    public init(apiKey: String, apiSecret: String) {
        let nonce = UUID().uuidString
        auth = Auth(apiKey: apiKey, apiSecret: apiSecret, nonce: nonce)
    }
}

// MARK: - Public Service
extension Bittrex {
    public func getMarkets(handler: @escaping (Result<GetMarketsResponse, APIKit.SessionTaskError>) -> Void) {
        let request = PublicService.GetMarkets()
        send(request, handler: handler)
    }
    
    public func getCurrencires(handler: @escaping (Result<GetCurrenciesResponse, APIKit.SessionTaskError>) -> Void) {
        let request = PublicService.GetCurrencies()
        send(request, handler: handler)
    }
    
    public func getTicker(market: String, handler: @escaping (Result<GetTickerResponse, APIKit.SessionTaskError>) -> Void) {
        let request = PublicService.GetTicker(market: market)
        send(request, handler: handler)
    }
    
    public func getMarketSummaries(handler: @escaping (Result<GetMarketSummariesResponse, APIKit.SessionTaskError>) -> Void) {
        let request = PublicService.GetMarketSummaries()
        send(request, handler: handler)
    }
    
    public func getMarketSummary(market: String, handler: @escaping (Result<GetMarketSummaryResponse, APIKit.SessionTaskError>) -> Void) {
        let request = PublicService.GetMarketSummary(market: market)
        send(request, handler: handler)
    }
    
    public func getOrderBook(market: String, handler: @escaping (Result<GetOrderBookResponse, APIKit.SessionTaskError>) -> Void) {
        let request = PublicService.GetOrderBook(market: market)
        send(request, handler: handler)
    }
    
    public func getSellOrders(market: String, handler: @escaping (Result<GetOrdersResponse, APIKit.SessionTaskError>) -> Void) {
        let request = PublicService.GetSellOrders(market: market)
        send(request, handler: handler)
    }
    
    public func getBuyOrders(market: String, handler: @escaping (Result<GetOrdersResponse, APIKit.SessionTaskError>) -> Void) {
        let request = PublicService.GetBuyOrders(market: market)
        send(request, handler: handler)
    }
    
    public func getMarketHistory(market: String, handler: @escaping (Result<GetMarketHistoryResponse, APIKit.SessionTaskError>) -> Void) {
        let request = PublicService.GetMarketHistory(market: market)
        send(request, handler: handler)
    }
}

// MARK: - Account Service
extension Bittrex {
    public func getBalances(handler: @escaping (Result<GetBalancesResponse, APIKit.SessionTaskError>) -> Void) {
        let request = AccountService.GetBalances(apiKey: auth.apiKey, nonce: auth.nonce)
        send(request, handler: handler)
    }
    
    public func getBalance(currency: String, handler: @escaping (Result<GetBalanceResponse, APIKit.SessionTaskError>) -> Void) {
        let request = AccountService.GetBalance(currency: currency, apiKey: auth.apiKey, nonce: auth.nonce)
        send(request, handler: handler)
    }
    
    public func getDepositAddress(currency: String, handler: @escaping (Result<GetDepositAddressResponse, APIKit.SessionTaskError>) -> Void) {
        let request = AccountService.GetDepositAddress(currency: currency, apiKey: auth.apiKey, nonce: auth.nonce)
        send(request, handler: handler)
    }
    
    public func withdraw(currency: String, quantity: Double, address: String, handler: @escaping (Result<WithdrawResponse, APIKit.SessionTaskError>) -> Void) {
        let request = AccountService.Withdraw(currency: currency, quantity: quantity, address: address, apiKey: auth.apiKey, nonce: auth.nonce)
        send(request, handler: handler)
    }
}

// MARK: - Market Service
extension Bittrex {
    public func buyLimit(market: String, quantity: Double, rate: Double, handler: @escaping (Result<BuySellLimitResponse, APIKit.SessionTaskError>) -> Void) {
        let request = MarketService.BuyLimit(market: market, quantity: quantity, rate: rate, apiKey: auth.apiKey, nonce: auth.nonce)
        send(request, handler: handler)
    }
    
    public func sellLimit(market: String, quantity: Double, rate: Double, handler: @escaping (Result<BuySellLimitResponse, APIKit.SessionTaskError>) -> Void) {
        let request = MarketService.SellLimit(market: market, quantity: quantity, rate: rate, apiKey: auth.apiKey, nonce: auth.nonce)
        send(request, handler: handler)
    }
    
    public func cancel(uuid: String, handler: @escaping (Result<CancelResponse, APIKit.SessionTaskError>) -> Void) {
        let request = MarketService.Cancel(uuid: uuid, apiKey: auth.apiKey, nonce: auth.nonce)
        send(request, handler: handler)
    }
    
    public func getOpenOrders(market: String, handler: @escaping (Result<GetOpenOrdersResponse, APIKit.SessionTaskError>) -> Void) {
        let request = MarketService.GetOpenOrders(market: market, apiKey: auth.apiKey, nonce: auth.nonce)
        send(request, handler: handler)
    }
}

extension Bittrex {
    public func send<Request: BittrexRequest>(_ request: Request, handler: @escaping (Result<Request.Response, APIKit.SessionTaskError>) -> Void) {
        let httpRequest = HTTPRequest(request, auth: auth)
        Session.shared.send(httpRequest, handler: handler)
    }
}
