//
//  Environment.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 11.06.2023.
//

import Foundation

public enum EnvironmentAPI {
    enum Keys {
        static let coinDataURL = "COIN_DATA_URL"
        static let marketDataURL = "MARKET_DATA_URL"
        static let coinDetailBaseURL = "COIN_DETAIL_BASE_URL"
        static let coinDetailKey = "COIN_DETAIL_KEY"
        static let newsBaseURL = "NEWS_BASE_URL"
        static let newsAPIKey = "NEWS_API_KEY"
    }
    
    ///Getting plist here
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist file not found")
        }
        return dict
    }()
    
    ///Getting baseurl and API keys from plist
    static let coinDataURL: String = {
        guard let coinDataURL = EnvironmentAPI.infoDictionary[Keys.coinDataURL] as? String else {
            fatalError("coinDataURL not set in plist")
        }
        return coinDataURL
    }()
    
    static let marketDataURL: String = {
        guard let marketDataURL = EnvironmentAPI.infoDictionary[Keys.marketDataURL] as? String else {
            fatalError("marketDataURL not set in plist")
        }
        return marketDataURL
    }()
    
    static let coinDetailBaseURL: String = {
        guard let coinDetailBaseURL = EnvironmentAPI.infoDictionary[Keys.coinDetailBaseURL] as? String else {
            fatalError("coinDetailBaseURL not set in plist")
        }
        return coinDetailBaseURL
    }()
    
    static let coinDetailKey: String = {
        guard let coinDetailKey = EnvironmentAPI.infoDictionary[Keys.coinDetailKey] as? String else {
            fatalError("coinDetailKey not set in plist")
        }
        return coinDetailKey
    }()
    
    static let newsBaseURL: String = {
        guard let newsBaseURL = EnvironmentAPI.infoDictionary[Keys.newsBaseURL] as? String else {
            fatalError("newsBaseURL not set in plist")
        }
        return newsBaseURL
    }()
    
    static let newsAPIKey: String = {
        guard let newsAPIKey = EnvironmentAPI.infoDictionary[Keys.newsAPIKey] as? String else {
            fatalError("newsAPIKey not set in plist")
        }
        return newsAPIKey
    }()
    
}
