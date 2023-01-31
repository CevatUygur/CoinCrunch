//
//  ProfileView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 28.01.2023.
//

import SwiftUI

struct MenuView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolioView: Bool = false // <- new sheet
    @State private var selectedCoin: CoinModel?
    @State private var showDetailView: Bool = false
    @State private var showSettingsView: Bool = false // <- new sheet
    
    var body: some View {
        //profileBodyView
        VStack{
            menuHeader
            NavigationView {
                List {
                    Text("App Settings")
                }
                
                .onTapGesture {
                    showSettingsView.toggle()
                }
                
                }
            .sheet(isPresented: $showSettingsView) {
                SettingsView()
            }
        }
       
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuView()
        }
        .environmentObject(dev.homeVM)
    }
}

extension MenuView {
    
    private var profileBodyView: some View {
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
                menuHeader
                HomeStatsView(showPortfolio: true)
                columnTitles
                
                portfolioCoinsList
                    .transition(.move(edge: .trailing))
                
                Spacer(minLength: 0)
            }

        }
        .background(
            NavigationLink(isActive: $showDetailView, destination: {
                DetailLoadingView(coin: $selectedCoin)
            }, label: { EmptyView() })
        )
    }
    
    private var menuHeader: some View {
        HStack {
            Text("Menu")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            //CircleButtonView(iconName: "info")
//                .onTapGesture {
//                    showPortfolioView.toggle()
//                }
        }
        .padding(.horizontal)
        //.padding(.top, 1)
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
        }
        .listStyle(PlainListStyle())
        .refreshable {
            vm.reloadData()
        }
    }

    private var columnTitles: some View {
        HStack {
            HStack(spacing: 4) {
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
                }
            }

            Spacer()

            HStack(spacing: 4) {
                Text("Holdings")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .holdings || vm.sortOption == .holdingsReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOption = vm.sortOption == .holdings ? .holdingsReversed : .holdings
                }
            }

            HStack(spacing: 4) {
                Text("Price")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .price || vm.sortOption == .priceReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))
            }
            .frame(width: UIScreen.main.bounds.width / 3.2, alignment: .trailing)
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
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
}
