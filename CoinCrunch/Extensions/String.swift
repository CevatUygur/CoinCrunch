//
//  String.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 24.01.2023.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
