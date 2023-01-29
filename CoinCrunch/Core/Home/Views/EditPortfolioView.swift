//
//  PortfolioView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 21.01.2023.
//

import SwiftUI

struct EditPortfolioView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedCoin: CoinModel?
    @State private var quantityText: String = ""
    @State private var showCheckmark: Bool = false
    
    private var showSaveButton: Bool {
        guard let quantityDouble = Double(quantityText.replacingOccurrences(of: ",", with: ".")) else { return false}
        
        if selectedCoin != nil && selectedCoin?.currentHoldings != quantityDouble {
            
            if vm.portfolioCoins.first(where: { $0.id == selectedCoin?.id }) != nil {
                return true
            }
            
            if quantityDouble != 0 {
                return true
            } else {
                return false
            }
        }
        
        return false
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    coinLogoList
                    
                    if selectedCoin != nil {
                        portfolioInputSection
                    }
                    
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    //XMarkButton(dismiss: _dismiss)

                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavBarButtons
                }
            })
            .onChange(of: vm.searchText) { value in
                if value == "" {
                    removeSelectedCoin()
                }
            }
        }
    }
}

struct EditPortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        EditPortfolioView()
            .environmentObject(dev.homeVM)
    }
}

extension EditPortfolioView {
    
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false, content: { LazyHStack(spacing: 10){
            ForEach(vm.searchText.isEmpty ? vm.portfolioCoins : vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                updateSelectedCoin(coin: coin)
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 1)
                        )
                        .opacity(selectedCoin?.id == coin.id ? 1.0 : 0.7)
                        .scaleEffect(x: selectedCoin?.id == coin.id ? 1.0 : 0.9, y: selectedCoin?.id == coin.id ? 1.0 : 0.9)
                }
            }
            .frame(height: 120)
            .padding(.leading)
        })
    }
    
    private func updateSelectedCoin(coin: CoinModel) {
        selectedCoin = coin
        
        if let portfolioCoin = vm.portfolioCoins.first(where: { $0.id == coin.id }),
           let amount = portfolioCoin.currentHoldings {
            quantityText = "\(amount)"
        } else {
            quantityText = ""
        }
        
    }
    
    private func getCurrentValue() -> Double {
        
        guard let quantityDouble = Double(quantityText.replacingOccurrences(of: ",", with: ".")) else { return 0 }
        
        return quantityDouble * (selectedCoin?.currentPrice ?? 0)
        
    }
    
    private var portfolioInputSection: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            Divider()
            HStack {
                Text("Amount in portfolio:")
                Spacer()
                TextField("Ex: 1.6", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack {
                Text("Current Value:")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        .padding()
        .font(.headline)
    }
    
    private var trailingNavBarButtons: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckmark ? 1.0 : 0.0)
            Button {
                saveButtonTapped()
            } label: {
                Text("Save".uppercased())
            }
        }
        .disabled(!showSaveButton)
        .font(.headline)
    }
    
    private func saveButtonTapped() {
        
        guard let coin = selectedCoin else { return }
        guard let quantityDouble = Double(quantityText.replacingOccurrences(of: ",", with: ".")) else { return }
        
        // save to portfolio
        
        vm.updatePortfolio(coin: coin, amount: quantityDouble)
        
        // show checkmark
        withAnimation(.easeIn) {
            showCheckmark = true
        }
        
        // remove selectedCoin
        removeSelectedCoin()
        
        
        // hide keyboard
        UIApplication.shared.endEditing()
        
        // hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut) {
                showCheckmark = false
            }
        }
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchText = ""
        quantityText = ""
    }
    
}
