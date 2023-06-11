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
    
    var formattingNewsCategoriesString: String {
        return self.replacingOccurrences(of: "|", with: " | ", options: .literal, range: nil).uppercased()
    }
    
    var formattingNewsTagsString: String {
        return self.replacingOccurrences(of: "|", with: ", ", options: .literal, range: nil).capitalized
    }
    
    /// Truncates any string to defined length and adds ... to end.
    /// ```
    /// Truncates Etherium to Ether... for length: 5
    /// ```
    func trunc(length: Int, trailing: String = "…") -> String {
        return (self.count > length) ? self.prefix(length) + trailing : self
    }
}





