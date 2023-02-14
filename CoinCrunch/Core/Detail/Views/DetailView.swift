//
//  DetailView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 22.01.2023.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    
    @EnvironmentObject private var homevm: HomeViewModel
    @StateObject private var vm: DetailViewModel
    @State private var showFullDescription: Bool = false
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    private let spacing: CGFloat = 20
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ChartView(coin: vm.coin)
                    .padding(.vertical)
                
                VStack(spacing: 16) {
                    overviewTitle
                    Divider()
                    descriptionSection
                    overviewGrid
                    additionalTitle
                    Divider()
                    additionalGrid
                    Divider()
                    websiteSection
                }
                .padding()
            }
        }
        .navigationBarTitle(vm.coin.name, displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                navigationBarTrailingItems
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coin: dev.coin)
        }
    }
}

extension DetailView {
    
    private var navigationBarTrailingItems: some View {
        HStack {
            Button {
                homevm.updateWatchList(coin: vm.coin)
            } label: {
                //check watchList
                if homevm.checkWatchList(coin: vm.coin) {
                    Image(systemName: "star.fill")
                } else {
                    Image(systemName: "star")
                }

            }
            Text(vm.coin.symbol.uppercased())
                .font(.headline)
            .foregroundColor(Color.theme.secondaryText)
            CoinImageView(coin: vm.coin)
                .frame(width: 25, height: 25)
        }
    }
    
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additionalTitle: some View {
        Text("Details")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var descriptionSection: some View {
        ZStack {
            if let coinDescription = vm.coinDescription, !coinDescription.isEmpty {
                VStack(alignment: .leading) {
                    Text(coinDescription)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.callout)
                        .foregroundColor(Color.theme.secondaryText)
                    Button {
                        withAnimation(.easeInOut) {
                            showFullDescription.toggle()
                        }
                    } label: {
                        Text(showFullDescription ? "Show less" : "Read more...")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.vertical, 4)
                            .accentColor(.blue)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    private var overviewGrid: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: spacing, pinnedViews: []) {
            ForEach(vm.overviewStatistics) { stat in
                StatisticView(stat: stat)
            }
        }
    }
    
    private var additionalGrid: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: spacing, pinnedViews: []) {
            ForEach(vm.additionalStatistics) { stat in
                StatisticView(stat: stat)
            }
        }
    }
    
    private var websiteSection: some View {
        HStack(alignment: .top, spacing: 0) {
            if let websiteString = vm.websiteURL,
               let url = URL(string: websiteString) {
                Button {
                    UIApplication.shared.open(url)
                } label: {
                    HStack {
                        Image(systemName: "link")
                        Text("Website")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.theme.secondaryText.opacity(0.15))
                    .cornerRadius(10)
                }
            }

            Spacer()
            
            if let redditString = vm.redditURL,
               let url = URL(string: redditString) {
                Button {
                    UIApplication.shared.open(url)
                } label: {
                    HStack {
                        Image(systemName: "link")
                        Text("Reddit")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.theme.secondaryText.opacity(0.15))
                    .cornerRadius(10)
                    
                }
            }
        }
        .accentColor(.blue)
        .frame(maxWidth: .infinity)
        .font(.headline)
    }
    
}
