//
//  PortfolioView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 28.01.2023.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolioView: Bool = false // <- new sheet
    @State private var selectedCoin: CoinModel?
    @State private var showDetailView: Bool = false
    
    @State private var animationsRunning = false
    
    var body: some View {
        portfolioBodyView
            .tabItem {
                Label("Portfolio", systemImage: "chart.pie")
                    .accessibilityLabel("Portfolio")
            }
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                PortfolioView()
                    .preferredColorScheme(.light)
            }
            NavigationView {
                PortfolioView()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(dev.homeVM)
    }
}

extension PortfolioView {
    
    private var portfolioBodyView: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView) {
                    EditPortfolioView()
                        .environmentObject(vm)
                }
            
            // content layer
            VStack {
                profileHeader
                
                HomeStatsView()
                    .frame(width: UIScreen.main.bounds.width, alignment: .trailing)
               
                SearchBarView(searchText: $vm.searchText)
                    .onDisappear{
                        endEditingForSearchBar()
                    }
                
                if vm.portfolioCoins.isEmpty {
                    emptyView
                } else {
                    columnTitles
                    
                    portfolioCoinsList
                    
                }
                Spacer(minLength: 0)
            }
        }
        .background(
            NavigationLink(isActive: $showDetailView, destination: {
                CoinDetailLoadingView(coin: $selectedCoin)
            }, label: { EmptyView() })
        )
    }
    
    private var profileHeader: some View {
        HStack {
            Text("Portfolio")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "plus")
                .onTapGesture {
                    showPortfolioView.toggle()
                }
        }
        .padding(.horizontal)
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true, showStar: vm.checkWatchList(coin: coin) ? true : false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
            .alignmentGuide(.listRowSeparatorLeading) { _ in
                0
            }
        }
        .listStyle(PlainListStyle())
        .refreshable {
            vm.reloadCoinData()
        }
    }
    
    private var emptyView: some View {
        VStack {
            VStack{
                
                if #available(iOS 17.0, *) {
                    Image(systemName: "chart.pie.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 160)
                        .symbolEffect(.bounce.up.byLayer, value: animationsRunning)
                } else {
                    Image(systemName: "chart.pie.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 160)
                }
                
                VStack(spacing: 20) {
                    
                    Text("Find and follow your winning coins")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        HStack {
                            Image(systemName: "star.fill")
                            Text("Choose your favorite coins")
                        }
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        
                        HStack {
                            Image(systemName: "newspaper.fill")
                            Text("Get relevant news updates")
                            Text("[SOON]")
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundStyle(Color.theme.green)
                        }
                        .font(.subheadline)

                        HStack {
                            Image(systemName: "bell.badge.fill")
                            Text("Receive real-time alerts")
                            Text("[SOON]")
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundStyle(Color.theme.green)
                        }
                        .font(.subheadline)
                    }
                }
                .padding(.top, 20)
            }
            
            Button {
                //showAddToWatchListView.toggle()
            } label: {
                Text("Get Started")
                    .fontWeight(.semibold)
                    .frame(width: 320, height: 52)
                    .background(Color.theme.yellow)
                    .foregroundStyle(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding(.top, 24)
        }
        .onAppear{
            animationsRunning.toggle()
        }
    }

    private var columnTitles: some View {
        HStack {
            HStack(spacing: 4) {
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortCoinsOption == .rank || vm.sortCoinsOption == .rankReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortCoinsOption == .rank ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortCoinsOption = vm.sortCoinsOption == .rank ? .rankReversed : .rank
                }
            }
            Spacer()
            HStack(spacing: 4) { 
                Text("Holdings")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortCoinsOption == .holdings || vm.sortCoinsOption == .holdingsReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortCoinsOption == .holdings ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortCoinsOption = vm.sortCoinsOption == .holdings ? .holdingsReversed : .holdings
                }
            }
            HStack(spacing: 4) {
                Text("Current Price")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortCoinsOption == .price || vm.sortCoinsOption == .priceReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortCoinsOption == .price ? 0 : 180))
            }
            .frame(width: UIScreen.main.bounds.width / 4.2, alignment: .trailing)
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortCoinsOption = vm.sortCoinsOption == .price ? .priceReversed : .price
                }
            }
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
    
    private func segue(coin: CoinModel) {
        selectedCoin = coin
        showDetailView.toggle()
    }
    
    private func endEditingForSearchBar() {
        UIApplication.shared.endEditing()
        vm.searchText = ""
    }
}
