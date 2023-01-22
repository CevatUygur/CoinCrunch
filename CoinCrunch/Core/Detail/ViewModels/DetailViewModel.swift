//
//  DetailViewModel.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 23.01.2023.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: CoinDetailsDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailsDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
        coinDetailService.$coinDetails
            .sink { (returnedCoinDetails) in
                print("DEBUG: Received Coin Detail Data")
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
        
    }
}
