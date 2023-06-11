//
//  NewsDetailView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 9.06.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetailLoadingView: View {
    
    @Binding var new: News?
    
    var body: some View {
        ZStack {
            if let new = new {
                NewsDetailView(new: new)
            }
        }
    }
}

struct NewsDetailView: View {
    
    @EnvironmentObject private var homevm: HomeViewModel
    @StateObject private var vm: NewsDetailViewModel
    
    init(new: News) {
        _vm = StateObject(wrappedValue: NewsDetailViewModel(new: new))
    }
    
    var body: some View {
        fullDetailView
    }
}

extension NewsDetailView {
    
    private var fullDetailView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                titleView
                dateAndSourceView
                imageView
                categoriesView
                bodyView
                tagsView
                websiteSection
            }
            .padding(12)
        }
        .navigationBarTitle(vm.new.title, displayMode: .inline)
    }
    
    private var titleView: some View {
        Text(vm.new.title)
            .font(.title)
    }
    private var dateAndSourceView: some View {
        HStack{
            Text(Date().timeIntervalToDateAndTimeString(timeIn: vm.new.publishedOn))
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Spacer()
            Text("Source: \(vm.new.sourceInfo.name.capitalized)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
        }
    }
    private var imageView: some View {
        VStack(alignment: .center) {
            WebImage(url: URL(string: vm.new.imageurl))
                .resizable()
                .placeholder {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
                .scaledToFit()
        }
        .frame(maxWidth: .infinity)
    }
    private var categoriesView: some View {
        VStack(alignment: .trailing) {
            Text(vm.new.categories.formattingNewsCategoriesString)
                .font(.caption2)
                .foregroundColor(Color.theme.secondaryText)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    private var bodyView: some View {
        Text(vm.new.body)
            .font(.body)
            .foregroundColor(Color.theme.accent)
    }
    private var tagsView: some View {
        Text("Tags: \(vm.new.tags.formattingNewsTagsString)")
            .font(.caption)
            .foregroundColor(Color.theme.secondaryText)
    }
    private var websiteSection: some View {
        HStack(alignment: .top, spacing: 0) {
            if let url = URL(string: vm.new.url) {
                Button {
                    UIApplication.shared.open(url)
                } label: {
                    HStack {
                        Spacer()
                        HStack{
                            Image(systemName: "link")
                                .padding(.trailing, 10)
                            VStack(alignment: .trailing, spacing: 2) {
                                Text("Read full version on")
                                    .font(.caption)
                                Text("website")
                                    .font(.caption)
                            }
                        }
                        Spacer()
                        HStack(alignment: .center){
                            WebImage(url: URL(string: vm.new.sourceInfo.img))
                                .resizable()
                                .placeholder {
                                    ProgressView()
                                }
                                .frame(width: 36, height: 36)
                                .scaledToFit()
                                .cornerRadius(4)
                            Text("\(vm.new.sourceInfo.name)")
                                .font(.callout)
                        }
                        Spacer()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(10)
                    .background(Color.theme.secondaryText.opacity(0.15))
                    .cornerRadius(10)
                }
            }
        }
        .accentColor(Color.theme.accent)
        .frame(maxWidth: .infinity)
        .font(.headline)
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewsDetailView(new: dev.new)
                .preferredColorScheme(.light)
            NewsDetailView(new: dev.new)
                .preferredColorScheme(.dark)
        }
    }
}
