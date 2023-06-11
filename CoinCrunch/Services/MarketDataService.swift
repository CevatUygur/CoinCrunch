//
//  MarketDataService.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 21.01.2023.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: MarketDataModel?
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData() {
        
        guard let url = URL(string: EnvironmentAPI.marketDataURL) else { return }
                
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self , decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
    }
}
