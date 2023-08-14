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
    @State private var hideDoneButton: Bool = false
    
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
                        .onDisappear {
                            endEditingForSearchBar()
                        }
                        .padding(.top, 16)
                    coinLogoList
                }
            }
            .navigationTitle("Edit Watchlist")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavBarButtons
                }
            })
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
                CoinLogoView(coin: coin, showStar: vm.checkWatchList(coin: coin) ? true : false)
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
        .frame(height: 120)
        .padding()
            
        })
    }

    private var trailingNavBarButtons: some View {
        
        Button {
            doneButtonTapped()
        } label: {
            
            if !hideDoneButton {
                Text("Done".uppercased())
                    .font(.headline)
            }
            
            if showCheckmark {
                Image(systemName: "checkmark")
                    .font(.headline)
            }
        }
    }
    
    private func doneButtonTapped() {
        
        // show checkmark
        withAnimation(.easeIn) {
            showCheckmark = true
        }
        
        // hide doneButton
        hideDoneButton = true
        
        // end editing
        endEditingForSearchBar()
                
        // dismiss with delay for better UX
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            dismiss()
        }
        
    }
    
    func endEditingForSearchBar() {
        UIApplication.shared.endEditing()
        vm.searchText = ""
    }
    
}
