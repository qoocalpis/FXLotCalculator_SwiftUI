//
//  TestView.swift
//  LotCalculatorApp
//
//  Created by 川人悠生 on 2023/03/18.
//

import SwiftUI
import RealmSwift


struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}


struct TestView: View {
    @State var selected = 0
        
    var body: some View {
        VStack(spacing: 0) {
            
            TabView(selection: $selected) {

            }
            // スワイプアクションを有効化
            .disabled(false)
            // ページスタイル（インジケータ非表示）
            .tabViewStyle(.page(indexDisplayMode: .never))
            // 切り替え時のアニメーション
            .animation(.easeInOut, value: selected)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}





//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        OView()
//    }
//}
