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
```

## Supported API
#### Public APIs
```swift

```

#### Account APIs
```swift

```

#### Market APIs
```swift

```

## Requirements
- Swift 4.0 or later
- iOS 10.0 or later

## Installation
#### [Carthage](https://github.com/Carthage/Carthage)

- Insert `github "yuzushioh/BittrexKit"` to your Cartfile.
- Run `carthage update --platform ios`.
