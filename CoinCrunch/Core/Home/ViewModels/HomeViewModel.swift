//
//  HomeViewModel.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 19.01.2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticModel] = []
    @Published var allCoins: [CoinModel] = []
    @Published var allNews: [News] = [] //<- news
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    @Published var sortCoinsOption: SortCoinsOption = .rank
    @Published var sortNewsOption: SortNewsOption = .publishedOn //<- news
    @Published var watchListCoins: [CoinModel] = [] //<- watchlist
    
    private let coinDataService = CoinDataService()
    private var newsDataService = NewsDataService() //<- news
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    private let watchListDataService = WatchListDataService() //<- watchlist
    
    private var cancellables = Set<AnyCancellable>()
    
    enum SortCoinsOption {
        case rank, rankReversed, holdings, holdingsReversed, price, priceReversed
    }
    
    enum SortNewsOption {
        case id, publishedOn
    }
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins, $sortCoinsOption)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterAndSortCoins)
            .sink { [weak self] (returnedCoins) in
                guard let self = self else { return }
                self.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        // updates allNews
        $searchText
            .combineLatest(newsDataService.$allNews, $sortNewsOption)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterAndSortNews)
            .sink { [weak self] (returnedNews) in
                guard let self = self else { return }
                self.allNews = returnedNews
            }
            .store(in: &cancellables)
        
        // updates portfolio coins
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map(mapAllCoinsToPortfolioCoins)
            .sink { [weak self] (returnedCoins) in
                guard let self = self else { return }
                self.portfolioCoins = self.sortPortfolioCoinsIfNeeded(coins: returnedCoins)
            }
            .store(in: &cancellables)
        
        // updates watchList coins
        $allCoins
            .combineLatest(watchListDataService.$savedEntities)
            .map(mapAllCoinsToWatchListCoins)
            .sink { [weak self] (returnedCoins) in
                guard let self = self else { return }
                self.watchListCoins = self.sortPortfolioCoinsIfNeeded(coins: returnedCoins)
            }
            .store(in: &cancellables)
        
        // updates marketData
        marketDataService.$marketData
            .combineLatest($portfolioCoins)
            .map(mapGlobalMarketData)
            .sink { [weak self] (returnedStats) in
                self?.statistics = returnedStats
            }
            .store(in: &cancellables)
        
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
    
    func checkPortfolio(coin: CoinModel) -> Bool {
        portfolioDataService.checkPortfolio(coin: coin)
    }
    
    func checkWatchList(coin: CoinModel) -> Bool {
        watchListDataService.checkWatchList(coin: coin)
    }
    
    func updateWatchList(coin: CoinModel) {
        watchListDataService.updateWatchList(coin: coin)
    }
    
    func reloadCoinData() {
        coinDataService.getCoins()
        marketDataService.getData()
        print("DEBUG: All Coins Count: \(allCoins.count)")
    }
    
    func reloadNewsData() {
        newsDataService.getNews()
        print("DEBUG: All News Count: \(allNews.count)")
    }
    
    private func filterAndSortCoins(text: String, coins: [CoinModel], sort: SortCoinsOption) -> [CoinModel] {
        var updatedCoins = filterCoins(text: text, coins: coins)
        SortCoins(sort: sort, coins: &updatedCoins)
        
        return updatedCoins
    }
    
    private func filterAndSortNews(text: String, news: [News], sort: SortNewsOption) -> [News] {
        var updatedNews = filterNews(text: text, news: news)
        SortNews(sort: sort, news: &updatedNews)
        
        return updatedNews
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercasedText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
    
    private func filterNews(text: String, news: [News]) -> [News] {
        guard !text.isEmpty else {
            return news
        }
        
        let lowercasedText = text.lowercased()
        
        return news.filter { (new) -> Bool in
            return new.title.lowercased().contains(lowercasedText) ||
            new.body.lowercased().contains(lowercasedText) ||
            new.tags.lowercased().contains(lowercasedText)
        }
    }
    
    private func SortCoins(sort: SortCoinsOption, coins: inout [CoinModel]) {
        switch sort {
        case .rank, .holdings: coins.sort(by: { $0.rank < $1.rank })
        case .rankReversed, .holdingsReversed: coins.sort(by: { $0.rank > $1.rank })
        case .price: coins.sort(by: { $0.currentPrice > $1.currentPrice })
        case .priceReversed: coins.sort(by: { $0.currentPrice < $1.currentPrice })
        }
    }
    
    private func SortNews(sort: SortNewsOption, news: inout [News]) {
        switch sort {
        case .id: news.sort(by: { $0.id > $1.id })
        case .publishedOn: news.sort(by: { $0.publishedOn > $1.publishedOn })
        }
    }
    
    private func sortPortfolioCoinsIfNeeded(coins: [CoinModel]) -> [CoinModel] {
        //will only sort by holdings or reversedholdings if needed
        switch sortCoinsOption {
        case .holdings: return coins.sorted(by: { $0.currentHoldingsValue > $1.currentHoldingsValue })
        case .holdingsReversed: return coins.sorted(by: { $0.currentHoldingsValue < $1.currentHoldingsValue })
        default: return coins
        }
    }
    
    private func mapAllCoinsToPortfolioCoins(allCoins: [CoinModel], portfolioEntities: [PortfolioEntity]) -> [CoinModel] {
        allCoins
            .compactMap { (coin) -> CoinModel? in
                guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
                    return nil
                }
                return coin.updateHoldings(amount: entity.amount)
            }
    }
    
    // for watchlist
    private func mapAllCoinsToWatchListCoins(allCoins: [CoinModel], watchListEntities: [WatchListEntity]) -> [CoinModel] {
        allCoins
            .compactMap { (coin) -> CoinModel? in
                guard watchListEntities.first(where: { $0.coinID == coin.id }) != nil else {
                    return nil
                }
                return coin.updateHoldings(amount: 0)
            }
    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?, portfolioCoins: [CoinModel]) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        
        guard let data = marketDataModel else { return stats }
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
                
        let portfolioValue = portfolioCoins
            .map({ $0.currentHoldingsValue })
            .reduce(0, +)
        
        let previousValue = portfolioCoins
            .map { (coin) -> Double in
                let currentValue = coin.currentHoldingsValue
                let percentChange = (coin.priceChangePercentage24H ?? 0) / 100
                let previousValue = currentValue / (1 + percentChange)
                return previousValue
            }
            .reduce(0, +)
        
        var percentageChange: Double {
            if portfolioValue - previousValue == 0 {
                return 0
            }
            return ((portfolioValue - previousValue) / previousValue) * 100
        }
        
        let portfolio = StatisticModel(title: "Portfolio Value", value: portfolioValue.asCurrencyWith2Decimals(), percentageChange: percentageChange)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return stats
    }
    

}
