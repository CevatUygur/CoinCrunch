//
//  NewsDataService.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 8.06.2023.
//

import Foundation
import Combine

class NewsDataService {
    
    @Published var allNews: [News] = []
    
    var newSubscription: AnyCancellable?
    
    init() {
        getNews()
    }
    
    func getNews() {
    
        guard let url = URL(string: EnvironmentAPI.newsBaseURL + EnvironmentAPI.newsAPIKey) else { return }
        
        newSubscription = NetworkingManager.download(url: url)
            .decode(type: NewsResponse.self , decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedNews) in
                self?.allNews = returnedNews.data
                self?.newSubscription?.cancel()
            })
    }
}
