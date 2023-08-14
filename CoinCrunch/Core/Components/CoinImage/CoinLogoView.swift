//
//  CoinLogoView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 22.01.2023.
//

import SwiftUI

struct CoinLogoView: View {
    
    let coin: CoinModel
    
    let showStar: Bool
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                if showStar {
                    Image(systemName: "star.fill")
                        .foregroundStyle(Color.theme.yellow)
                        .font(.caption2)
                }
            }
            .frame(width: 80)
            
            CoinImageView(coin: coin)
                .frame(width: 50, height: 50)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text(coin.name.trunc(length: 10))
                .font(.caption2)
                .foregroundColor(Color.theme.secondaryText)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
        }
    }
}

struct CoinLogoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinLogoView(coin: dev.coin, showStar: true)
                .preferredColorScheme(.light)
            CoinLogoView(coin: dev.coin, showStar: true)
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
