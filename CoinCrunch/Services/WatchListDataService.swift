//
//  WatchListDataService.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 3.02.2023.
//

import Foundation
import CoreData

class WatchListDataService {
    
    private let container: NSPersistentContainer
    private let containerName: String = "PortfolioContainer"
    private let entityName: String = "WatchListEntity"
    
    @Published var savedEntities: [WatchListEntity] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print("Error loading Core Data! \(error)")
            }
            self.getWatchList()
        }
    }
    
    // MARK: - Public
    
    func updatePortfolio(coin: CoinModel) {
        
        // check if coin is already in portfolio
        if let entity = savedEntities.first(where: { $0.coinID == coin.id }) {
            delete(entity: entity)
        } else {
            add(coin: coin)
        }
    }
    
    func checkWatchList(coin: CoinModel) -> Bool {
        
        // check if coin is already in portfolio
        if savedEntities.first(where: { $0.coinID == coin.id }) != nil {
            return true
        } else {
            return false
        }
    }
    
    
    // MARK: - Private
    
    private func getWatchList() {
        let request = NSFetchRequest<WatchListEntity>(entityName: entityName)
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching Watchlist Entities. \(error)")
        }
    }
    
    private func add(coin: CoinModel) {
        let entity = WatchListEntity(context: container.viewContext)
        entity.coinID = coin.id
        applyChanges()
    }
    
//    private func update(entity: WatchListEntity, amount: Double) {
//        entity.amount = amount
//        applyChanges()
//    }
    
    private func delete(entity: WatchListEntity) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
    private func save(){
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data. \(error)")
        }
    }
    
    private func applyChanges() {
        save()
        getWatchList()
    }
    
}

