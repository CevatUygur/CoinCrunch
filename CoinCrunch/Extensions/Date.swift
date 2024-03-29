//
//  Date.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 23.01.2023.
//

import Foundation

extension Date {
    
    //2021-11-10T14:24:11.849Z
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
        
    }
    
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    private var dateAndTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
    
    func asShortDateString() -> String {
        return shortFormatter.string(from: self)
    }
    
    func dateAndTimeString() -> String {
        return dateAndTimeFormatter.string(from: self)
    }
    
    func timeIntervalToDateAndTimeString(timeIn: Int) -> String {
        return Date(timeIntervalSince1970: TimeInterval(timeIn)).dateAndTimeString()
    }
    
}
