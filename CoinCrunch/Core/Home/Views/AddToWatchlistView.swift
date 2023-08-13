//
//  AddToWatchlistView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 13.08.2023.
//

import SwiftUI

struct AddToWatchlistView: View {
    
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
                    //allCoinsList
                    
//                    if selectedCoin != nil {
//                        portfolioInputSection
//                    }
                    
                }
            }
            .navigationTitle("Edit Watchlist")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton(dismiss: _dismiss)

                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavBarButtons
                }
            })
//            .onChange(of: vm.searchText) { value in
//                if value == "" {
//                    removeSelectedCoin()
//                }
//            }
        }
    }
}

struct AddToWatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddToWatchlistView()
                .preferredColorScheme(.light)
            AddToWatchlistView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(dev.homeVM)
    }
}

extension AddToWatchlistView {
    
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false, content: { LazyHStack(spacing: 8){
            ForEach(vm.allCoins) { coin in
                CoinLogoView(coin: coin)
                    .frame(width: 82)
                    .padding(4)
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            vm.updateWatchList(coin: coin)
                        }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(vm.checkWatchList(coin: coin) ? Color.theme.green : Color.clear, lineWidth: 1)
                    )
                    .opacity(vm.checkWatchList(coin: coin) ? 1.0 : 0.8)
                    .scaleEffect(x: vm.checkWatchList(coin: coin) ? 1.0 : 0.95, y: vm.checkWatchList(coin: coin) ? 1.0 : 0.95)
                
            }
        }
        .frame(height: 150)
        .padding()
            
        })
    }

    
    private func updateSelectedCoin(coin: CoinModel) {
        
        selectedCoin = coin
        
        if let selectedCoin {
            vm.updateWatchList(coin: selectedCoin)
        }
                
    }
            
    private var trailingNavBarButtons: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckmark ? 1.0 : 0.0)
            Button {
                doneButtonTapped()
            } label: {
                Text("Done".uppercased())
            }
        }
        .font(.headline)
    }
    
    private func doneButtonTapped() {
        
        // show checkmark
        withAnimation(.easeIn) {
            showCheckmark = true
        }
                
        // hide keyboard
        UIApplication.shared.endEditing()
        vm.searchText = ""
        
        // dismiss
        dismiss()

    }
    
}
