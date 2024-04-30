//
//  HomeTabView.swift
//  SwiftAPIPractice
//
//  Created by 川人悠生 on 2023/02/19.
//

import SwiftUI
import RealmSwift


struct HomeTabView: View {
    
    @ObservedRealmObject var tradeModel: TradeModel_04
    @ObservedResults(CurrencyPairModel_04.self) var currencyPairModel
    @ObservedObject var vm = Info()
    @State var flag = 0
    @State var selected = AppConstants.lotCalculatorViewTag
    @Binding var rows: [[String: String]]
//    @State var focusKeyboard = false
    @StateObject var storeKit = StoreKitManager()
    @State var isPurchased = false
    @State var isSelected = true
    @State var updatedLastTime: Date? = nil
    @ObservedObject var googleSheetService = GoogleSheetService.instance
    
    var body: some View {
        VStack(spacing: 0) {
            
            HomeTabBarView(selected: $selected)
            
            TabView(selection: $selected) {
                LotCalculatorView()
                    .tag(AppConstants.lotCalculatorViewTag)
                    .onAppear(){
                        print("LotCalculatorView")
                    }
                RiskRewardView()
                    .tag(AppConstants.RiskRewardViewTag)
                    .onAppear(){
                        print("RiskRewardView")
                    }
            }
            // スワイプアクションを有効化
            .disabled(false)
            // ページスタイル（インジケータ非表示）
            .tabViewStyle(.page(indexDisplayMode: .never))
            // 切り替え時のアニメーション
            .animation(.easeInOut, value: selected)
        }
    }
    
    //        NavigationStack {
    //            VStack(spacing: 0) {
    //
    //                TabView(selection: $selected) {
    //                    LotCalculator(rows: $rows, vm: vm, focusKeyboard: $focusKeyboard, updatedLastTime: $updatedLastTime).tag(0)
    //                    RiskReward().tag(1)
    //                }
    //                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    //                ZStack {
    //                    Rectangle()
    //                        .frame(width: 50, height: 20)
    //                        .background(Color.gray)
    //                        .cornerRadius(5)
    //                        .opacity(0.1)
    //                    HStack {
    //                        Image(systemName: "circle.fill")
    //                            .font(.callout)
    //                            .foregroundColor(isSelected ? Color("colorCircle") : Color.gray)
    //                            .opacity(isSelected ? 1:0.2)
    //                        Image(systemName: "circle.fill")
    //                            .font(.callout)
    //                            .foregroundColor(isSelected ? Color.gray : Color("colorCircle"))
    //                            .opacity(isSelected ? 0.2:1)
    //                    }
    //                    .animation(.spring(), value: isSelected)
    //                }
    //                .padding(.bottom)
    //                HStack {
    //                    /// 画面遷移リンクの定義
    //                    NavigationLink {
    //                        Settings(storeKit: storeKit)                // 遷移先View
    //                    } label: {
    //                        Image(systemName: "gearshape.fill")
    //                            .font(.system(size: UIScreen.main.bounds.height/22))
    //                    }
    //                    .padding()
    //                    Spacer()
    //                    NavigationLink {
    //                        FavoriteCurrencyPair(rows: $rows, updatedLastTime: $updatedLastTime)
    //                    } label: {
    //                        Image("rate")
    //                            .resizable()
    //                            .scaledToFit()
    //                            .frame(height: UIScreen.main.bounds.height/22)
    //                            .clipShape(Circle())
    //                    }
    //                    .padding()
    //                }
    //                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/13)
    //                .background(Color("TabColor"))
    //            }
    //            .ignoresSafeArea(.keyboard, edges: focusKeyboard ? .top : .bottom)
    //        }
}

