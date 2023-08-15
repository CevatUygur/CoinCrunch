//
//  AnimatedSearchBarView.swift
//  CoinCrunch
//
//  Created by CEVAT UYGUR on 15.08.2023.
//

import SwiftUI

struct AnimatedSearchBarView: View {
    
    @Binding var searchText: String
    
    @State private var scaleRatioX = 0.7
    @State private var scaleRatioY = 0.7
        
    private var searchBarAnimation : Bool {
        scaleRatioX == 0.7 ? true : false
    }
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(searchBarAnimation ? .title2 : .title)
                .foregroundColor(
                    searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
            
            TextField("Search coin...", text: $searchText)
                .frame(height: searchBarAnimation ? 42 : 50, alignment: .leading)
                .foregroundColor(Color.theme.accent)
                .disableAutocorrection(true)
                .padding(.trailing, searchBarAnimation ? 0 : 32)
                .onTapGesture {
                    withAnimation {
                        scaleRatioX = 1.0
                        scaleRatioY = 1.0
                    }
                }
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .padding() //<- to extend tappable are for better UX
                        .offset(x: 16) //<- to extend tappable are for better UX
                        .foregroundColor(Color.theme.accent)
                        .opacity(searchBarAnimation ? 0.0 : 1.0)
                        .onTapGesture {
                            endEditing(withAnimation: true)
                            
                        }
                    , alignment: .trailing
                )
        }
        .font(.headline)
        .padding(.vertical, 5)
        .padding(.horizontal, 12)
        .background(
            RoundedRectangle(cornerRadius: searchBarAnimation ? 12 : 12)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.15), radius: 10, x: 0, y:0)
        )
        .padding(.horizontal, 12)
        .padding(.vertical, 4)
        .frame(alignment: .center)
        .scaleEffect(CGSize(width: scaleRatioX, height: scaleRatioY), anchor: .center)
        .padding(.horizontal, searchBarAnimation ? 88 : 0)
        .padding(.top, searchBarAnimation ? -12 : 0)
        .padding(.bottom, searchBarAnimation ? -8 : 4)
        .onDisappear{
            endEditing(withAnimation: false)
        }
    }
    
    private func endEditing(withAnimation animation: Bool){
        UIApplication.shared.endEditing()
        searchText = ""
        
        withAnimation(animation ? .default : .none) {
            scaleRatioX = 0.7
            scaleRatioY = 0.7
        }
    }
}


struct animatedSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AnimatedSearchBarView(searchText: .constant(""))
                .preferredColorScheme(.light)
            AnimatedSearchBarView(searchText: .constant(""))
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
