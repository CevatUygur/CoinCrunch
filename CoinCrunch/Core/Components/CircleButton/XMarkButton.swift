//
//  XMarkButton.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 11.06.2023.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Image(systemName: "xmark")
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .onTapGesture {
                dismiss()
            }
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
