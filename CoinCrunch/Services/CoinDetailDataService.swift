//
//  CoinDetailDataService.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 23.01.2023.
//

import Foundation
import Combine

class CoinDetailsDataService {
    
    @Published var coinDetails: CoinDetailModel?
    
    var coinDetailSubscription: AnyCancellable?
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=true&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }

        coinDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self , decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoinDetails) in
                //self?.allCoins.removeAll()
                self?.coinDetails = returnedCoinDetails
                self?.coinDetailSubscription?.cancel()
            })

    }
}
