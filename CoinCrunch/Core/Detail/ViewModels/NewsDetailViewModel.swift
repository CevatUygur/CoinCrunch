//
//  NewsDetailViewModel.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 9.06.2023.
//

import Foundation
import Combine

class NewsDetailViewModel: ObservableObject {

    @Published var new: News
    @Published var websiteURL: String?

    private let newsDetailService: NewsDataService
    private var cancellables = Set<AnyCancellable>()

    init(new: News) {
        self.new = new
        self.newsDetailService = NewsDataService()
    }
}
