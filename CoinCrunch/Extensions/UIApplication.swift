//
//  UIApplication.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 21.01.2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    // function to dissmis keyboard
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
