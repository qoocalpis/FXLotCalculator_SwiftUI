//
//  FirstLoadingRateView.swift
//  FX_LotSize
//
//  Created by user1 on 2024/04/20.
//

import SwiftUI

struct FirstLoadingRateView: View {
    var body: some View {
        ZStack {
            Color("FirstLoadingPageBackGroundColor")
                .ignoresSafeArea()
            
            VStack {
                // ラベルやアクセントカラーなどを指定してカスタマイズできる
                ProgressView()
                    .progressViewStyle(.circular)
                    .controlSize(.large)
                    .tint(Color.orange)
                
                Text("loading Rate")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(20)
            }
        }
    }
}

#Preview {
    FirstLoadingRateView()
}
