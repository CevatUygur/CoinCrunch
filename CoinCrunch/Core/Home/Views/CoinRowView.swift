//
//  CoinRowView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 19.01.2023.
//

import SwiftUI

struct CoinRowView: View {
    
    var coin: CoinModel
    let showHoldingsColumn: Bool
    let showStar: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            leftColumn
            Spacer()
            if showHoldingsColumn {
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
        .background(
            Color.theme.background.opacity(0.001)
        )
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin, showHoldingsColumn: false, showStar: true)
                .previewLayout(.sizeThatFits)
            
            CoinRowView(coin: dev.coin, showHoldingsColumn: true, showStar: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

extension CoinRowView {
    
    private var leftColumn: some View {
        HStack(spacing: 0) {
            arrowColumn
                .padding(.horizontal, 8)
            CoinImageView(coin: coin)
                .frame(height: 40)
                .background(Color.white)
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .center, spacing: 2) {
                    Text(coin.symbol.uppercased())
                        .frame(alignment: .leading)
                        .font(.headline)
                        .foregroundColor(Color.theme.accent)
                    if showStar {
                        Image(systemName: "star.fill")
                            .foregroundStyle(Color.theme.yellow)
                            .font(.caption)
                    }
                }
                Text(coin.name.trunc(length: 16))
                    .font(.caption)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.leading, 4  )
        }
        .frame(height: 70)
    }
    
    private var arrowColumn: some View {
    
        let imageName = "triangle.fill"
        
        return Image(systemName: imageName)
            .rotationEffect(
                Angle(degrees: coin.percentage24HoursUp ? 0 : 180))
            .foregroundColor(
                coin.percentage24HoursUp ? Color.theme.green : Color.theme.red
            )
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor(
                    coin.percentage24HoursUp ? Color.theme.green : Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 4.2, alignment: .trailing)
    }
}
