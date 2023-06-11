//
//  HomeStatsView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 21.01.2023.
//

import SwiftUI

struct HomeStatsView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeStatsView()
                .preferredColorScheme(.light)
            HomeStatsView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(dev.homeVM)
    }
}
