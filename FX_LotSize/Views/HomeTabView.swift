//
//  HomeTabView.swift
//  SwiftAPIPractice
//
//  Created by 川人悠生 on 2023/02/19.
//

import SwiftUI
import RealmSwift


struct HomeTabView: View {
    
    @ObservedResults(TradeModel_04.self) var tradeModel
    @ObservedResults(CurrencyPairModel_04.self) var currencyPairModel
    
    @State var selected = AppConstants.lotCalculatorViewTag
    @StateObject var storeKit = StoreKitManager()
    @StateObject var googleSheetService = GoogleSheetService.instance
    
    init(){
        print("HomeTabView")
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            HomeTabBarView(selected: $selected)
            
            TabView(selection: $selected) {
                LotCalculatorView()
                    .tag(AppConstants.lotCalculatorViewTag)

                RiskRewardView()
                    .tag(AppConstants.RiskRewardViewTag)
            }
            // スワイプアクションを有効化
            .disabled(false)
            // ページスタイル（インジケータ非表示）
            .tabViewStyle(.page(indexDisplayMode: .never))
            // 切り替え時のアニメーション
            .animation(.easeInOut, value: selected)
        }
    }
}

