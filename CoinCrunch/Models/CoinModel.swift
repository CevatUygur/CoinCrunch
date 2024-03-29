//
//  CoinModel.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 19.01.2023.
//

import Foundation

// API Info

/*

 URL:
        https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h

 JSON Response:
 
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 20727,
     "market_cap": 399180968865,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 435103982423,
     "total_volume": 40919016271,
     "high_24h": 21576,
     "low_24h": 20533,
     "price_change_24h": -446.6179618173701,
     "price_change_percentage_24h": -2.10935,
     "market_cap_change_24h": -8224175978.078491,
     "market_cap_change_percentage_24h": -2.01867,
     "circulating_supply": 19266200,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 69045,
     "ath_change_percentage": -69.99159,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 67.81,
     "atl_change_percentage": 30455.29098,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2023-01-19T00:10:12.616Z",
     "sparkline_in_7d": {
       "price": [
         17996.832553741606,
         18287.298868179285
       ]
     },
     "price_change_percentage_24h_in_currency": -2.1093454742392206
   }
 
 */

struct CoinModel: Identifiable, Codable {
    var id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank: Double?
    let fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H, priceChange24H: Double?
    let priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H, circulatingSupply: Double?
    let totalSupply, maxSupply: Double?
    let ath, athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: atlDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
    
    var percentage24HoursUp: Bool {
        return priceChangePercentage24H ?? 0 >= 0 ? true : false
        
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
