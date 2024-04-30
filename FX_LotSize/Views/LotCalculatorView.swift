//
//  LotCalculatorView.swift
//  FX_LotSize
//
//  Created by user1 on 2024/04/21.
//

import SwiftUI

struct LotCalculatorView: View {
    
    //    init(){}
    var body: some View {
        GeometryReader { geometry in // ⬅︎ 親ビューはContentView
            VStack{
                ZStack{
                    UnevenRoundedRectangle(
                        cornerRadii: .init(
                            topLeading: 0.0,
                            bottomLeading: 15.0,
                            bottomTrailing: 15.0,
                            topTrailing: 0.0
                        ),
                        style: .continuous
                    )
                    .frame(height: geometry.size.height / 5)
                    .foregroundStyle(Color("CurrentSelectedCurrencyPairBackGroundColor"))
                }
                
                CalculationSetCell(
//                    calculatorModel: LotSizeCalculatorModel,
                    calculationTitle: "accountBalance",
                    text: "",
                    height: geometry.size.height, 
                    width: nil
                )
            }
            .ignoresSafeArea(.all)
        }
    }
    
}

#Preview {
    LotCalculatorView()
}
