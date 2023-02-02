//
//  ProfileView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 28.01.2023.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var manager: ColorSchemeManager
    
    @Environment(\.colorScheme) var current
    @EnvironmentObject var csManager: ColorSchemeManager
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolioView: Bool = false // <- new sheet
    @State private var selectedCoin: CoinModel?
    @State private var showDetailView: Bool = false
    //@ObservableObject private var showAppearanceSwithView: Bool // <- new sheet
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("general")) {
                    Text("About")
                }
                
                Section(header: Text("appearance"), footer: Text("If you choose Device settings, this app will use the mode that's already selected in the device's settings.")) {
                    AppearanceSelectionPicker
                }
                
            }
            .listStyle(.grouped)
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.inline)
        }
//        .sheet(isPresented: $manager.showAppearanceSwitchView) {
//            VStack {
//
//                if manager.colorScheme.rawValue == 0 {
//                    Text ("Device Settings Mode On")
//                } else if manager.colorScheme.rawValue == 1 {
//                    Text ("Light Mode On")
//                } else {
//                    Text ("Dark Mode On")
//                }
//
//            }
//            .frame(width: 100, height: 100)
//            .background(Color.red)
//        }
        .fullScreenCover(isPresented: $manager.showAppearanceSwitchView) {
            FullScreenModalView.init(manager: manager)
                
        }
        .transaction { transction in
            transction.disablesAnimations = true
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            //MenuView()
        }
        //.environmentObject(MenuView.csManager)
        .environmentObject(dev.homeVM)
    }
}

struct FullScreenModalView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var manager: ColorSchemeManager
    
    var body: some View {
        ZStack {
            VStack {
                if manager.colorScheme.rawValue == 0 {
                    Image(systemName: "arrow.turn.up.forward.iphone")
                        .font(.system(size: 80))
                        .padding()
                    Text("Device Settings Mode On")
                        .font(.system(size: 20))
                } else if manager.colorScheme.rawValue == 1 {
                    Image(systemName: "sun.max")
                        .font(.system(size: 80))
                        .padding()
                    Text("Light Mode On")
                        .font(.system(size: 20))
                } else {
                    Image(systemName: "moon.fill")
                        .font(.system(size: 80))
                        .padding()
                    Text("Dark Mode On")
                        .font(.system(size: 20))
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                dismiss()
            }
        }
    }
}

extension MenuView {
    
    private var AppearanceSelectionPicker: some View {

        Picker("App Theme", selection: $csManager.colorScheme) {
            Text("Device settings")
                .tag(ColorScheme.unspecified)
            Text("Dark mode")
                .tag(ColorScheme.dark)
            Text("Light mode")
                .tag(ColorScheme.light)
        }
        .pickerStyle(.automatic)
    }
    
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
            CircleButtonView(iconName: "info")
//                .onTapGesture {
//                    showPortfolioView.toggle()
//                }
        }
        .padding(.horizontal)
        //.padding(.top, 19)
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
