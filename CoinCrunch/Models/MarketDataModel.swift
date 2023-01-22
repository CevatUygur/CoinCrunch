//
//  MarketDataModel.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 21.01.2023.
//

import Foundation

// JSON data:
/*
 
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
 "data": {
   "active_cryptocurrencies": 12490,
   "upcoming_icos": 0,
   "ongoing_icos": 49,
   "ended_icos": 3376,
   "markets": 640,
   "total_market_cap": {
     "btc": 46966587.94901651,
     "eth": 656425012.4115036,
     "ltc": 11998577884.44698,
     "bch": 8245636940.542311,
     "bnb": 3578907658.98184,
     "eos": 1034622703743.5292,
     "xrp": 2644168518089.5586,
     "xlm": 11842610842989.697,
     "link": 156094216370.96725,
     "dot": 171059769335.9508,
     "yfi": 151169071.08462268,
     "usd": 1088423253685.8263,
     "aed": 3997800379253.1113,
     "ars": 199665803772396.1,
     "aud": 1563411161594.3208,
     "bdt": 114978139490362.14,
     "bhd": 410275703360.6031,
     "bmd": 1088423253685.8263,
     "brl": 5668290620545.025,
     "cad": 1457779684824.1074,
     "chf": 1001360277623.4979,
     "clp": 887391478730052.5,
     "cny": 7383427983703.15,
     "czk": 23930128076699.23,
     "dkk": 7459291084485.052,
     "eur": 1000629945620.2708,
     "gbp": 878540420831.0793,
     "hkd": 8527524086815.005,
     "huf": 393715343555773.4,
     "idr": 16395245997245686,
     "ils": 3702507885258.382,
     "inr": 88136433496276.88,
     "jpy": 141010665662659.34,
     "krw": 1339881677984862.5,
     "kwd": 332590582052.0313,
     "lkr": 398315236822077.2,
     "mmk": 2285419938863830.5,
     "mxn": 20543771228669.23,
     "myr": 4664437853670.602,
     "ngn": 495297885822272.7,
     "nok": 10658787428322.287,
     "nzd": 1681742360888.533,
     "php": 59243426263439.445,
     "pkr": 250171187476985.44,
     "pln": 4503514475613.151,
     "rub": 74637537286674.84,
     "sar": 4085778719271.7856,
     "sek": 11205861608322.412,
     "sgd": 1436392167889.1833,
     "thb": 35528976873420.73,
     "try": 20416533461890.055,
     "twd": 33014816027076.027,
     "uah": 39986913625285.734,
     "vef": 108983820391.5615,
     "vnd": 25522884004305240,
     "zar": 18628581671483.652,
     "xdr": 806593466915.9417,
     "xag": 45476043247.73461,
     "xau": 565098469.0811429,
     "bits": 46966587949016.51,
     "sats": 4696658794901651
   },
   "total_volume": {
     "btc": 4343368.343183175,
     "eth": 60704763.60081102,
     "ltc": 1109602498.7613783,
     "bch": 762538647.5979502,
     "bnb": 330969629.85839033,
     "eos": 95679667074.31062,
     "xrp": 244526978369.78482,
     "xlm": 1095179004527.9702,
     "link": 14435255094.017126,
     "dot": 15819237022.976942,
     "yfi": 13979788.323778078,
     "usd": 100655025423.0772,
     "aed": 369707921479.4707,
     "ars": 18464661138736.367,
     "aud": 144580878517.70807,
     "bdt": 10632929344636.275,
     "bhd": 37941408558.10177,
     "bmd": 100655025423.0772,
     "brl": 524191241398.29944,
     "cad": 134812308300.39807,
     "chf": 92603629939.48532,
     "clp": 82064042227434.67,
     "cny": 682803430459.9845,
     "czk": 2213006421703.0435,
     "dkk": 689819085731.9729,
     "eur": 92536090417.42607,
     "gbp": 81245515560.69421,
     "hkd": 788606960433.4519,
     "huf": 36409942346289.66,
     "idr": 1516196844455436.8,
     "ils": 342399911117.1133,
     "inr": 8150666502415.453,
     "jpy": 13040360989289.332,
     "krw": 123909355946570.69,
     "kwd": 30757256773.55509,
     "lkr": 36835330514077.64,
     "mmk": 211350686665085.9,
     "mxn": 1899843473855.497,
     "myr": 431357111450.5967,
     "ngn": 45804075869025.555,
     "nok": 985701578814.8872,
     "nzd": 155523891571.65384,
     "php": 5478703763910.91,
     "pkr": 23135289649816.58,
     "pln": 416475265941.79456,
     "rub": 6902317814017.097,
     "sar": 377843967839.4431,
     "sek": 1036293814243.29,
     "sgd": 132834437050.83481,
     "thb": 3285642840080.617,
     "try": 1888076800728.5095,
     "twd": 3053138689650.5703,
     "uah": 3697903176832.8164,
     "vef": 10078587695.612692,
     "vnd": 2360301040632800,
     "zar": 1722730891121.0505,
     "xdr": 74592017070.17822,
     "xag": 4205525997.11633,
     "xau": 52259082.64940733,
     "bits": 4343368343183.175,
     "sats": 434336834318317.5
   },
   "market_cap_percentage": {
     "btc": 41.02622490038365,
     "eth": 18.35259941283293,
     "usdt": 6.117625036302216,
     "usdc": 3.9874410882474796,
     "bnb": 3.76767229682002,
     "xrp": 1.9195920481270052,
     "busd": 1.4912217151121863,
     "ada": 1.217784129089186,
     "doge": 1.1047263756754457,
     "sol": 0.8641098961439087
   },
   "market_cap_change_percentage_24h_usd": 6.005772701546952,
   "updated_at": 1674326114
 }
}
 
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
    
}
