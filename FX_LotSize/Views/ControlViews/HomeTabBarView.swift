//
//  HomeTabBarView.swift
//  FX_LotSize
//
//  Created by user1 on 2024/04/21.
//

import SwiftUI

struct HomeTabBarView: View {
    @Binding var selected: Int
    var body: some View {
        VStack{
            if(selected == AppConstants.lotCalculatorViewTag){
                Text("lotSizeCalculatorTitle")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            if(selected == AppConstants.RiskRewardViewTag){
                Text("riskRewardRatioTitle")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            HStack {
                HomeTabBarButtonView(
                    selected: $selected,
                    image: Image("CalculatorIcon"),
                    color: Color(red: 0.3, green: 0.5, blue: 0.2),
                    tag: AppConstants.lotCalculatorViewTag
                )
                
                HomeTabBarButtonView(
                    selected: $selected,
                    image: Image("RiskRewardRatioIcon"),
                    color: Color.orange,
                    tag: AppConstants.RiskRewardViewTag
                )
            }
        }
        .frame(height: AppConstants.homeTabBarHeight)
        .background(Color("HomeTabBarBackGroundColor"))
    }
}

struct HomeTabBarButtonView: View {
    @Binding var selected: Int
    var image: Image
    var color: Color
    var tag: Int
    
    var body: some View {
        
        Button {
            selected = tag
        } label: {
            VStack(spacing: 0) {
                ZStack{
                    image
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.white)
                        .opacity(selected != tag ? 0.7 : 1)
                        .padding(2)
                }
                Rectangle()
                    .fill(color)
                    .frame(height: 6)
                    .opacity(selected != tag ? 0 : 1)
                    .padding([.leading, .trailing], 50)
            }
        }
    }
}

#Preview("Yes Preview") {
    HomeTabBarView(selected: .constant(0))
}

