# BittrexKit

BittrexKit is a Swift API client for Bittrex. See more details [here](https://www.bittrex.com/Home/Api).
It supports all the APIs provided 🎉

```swift
// You need to provide apiKey and apiSecret right now even to call public APIs.
let bittrex = BittrexKit(apiKey: "API_KEY", apiSecret: "API_SECRET")

bittrex.getBalances() { result in
  switch result {
    case .success(let response):
      // do something with my balances
    case .failure(let error):
      // handle any error
  }
}

bittrex.getTicker(market: "BTC-LTC") { result in
  switch result {
    case .success(let response):
      // do something with ticker
    case .failure(let error):
      // handle any error
  }
}
```

## Supported API
#### Public APIs
```swift
public func getMarkets()
public func getCurrencires()
public func getTicker(market: String)
public func getMarketSummaries()
public func getMarketSummary(market: String)
public func getOrderBook(market: String)
public func getSellOrders(market: String)
public func getBuyOrders(market: String)
public func getMarketHistory(market: String)
```

#### Account APIs
```swift
public func getBalances()
public func getBalance(currency: String)
public func getDepositAddress(currency: String)
public func withdraw(currency: String, quantity: Double, address: String)
```

#### Market APIs
```swift
public func buyLimit(market: String, quantity: Double, rate: Double)
public func sellLimit(market: String, quantity: Double, rate: Double)
public func cancel(uuid: String)
public func getOpenOrders(market: String)
```

## Requirements
- Swift 4.0 or later
- iOS 10.0 or later

## Installation
#### [Carthage](https://github.com/Carthage/Carthage)

- Insert `github "yuzushioh/BittrexKit"` to your Cartfile.
- Run `carthage update --platform ios`.

## Contribution 
Any pull requests are very welcome!
