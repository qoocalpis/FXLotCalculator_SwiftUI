//
//  CalculationSetCell.swift
//  FX_LotSize
//
//  Created by user1 on 2024/04/22.
//

import SwiftUI


struct CalculationSetCell: View {
//    @EnvironmentObject var calculatorModel: LotSizeCalculatorModel
    let calculationTitle: String
    let text: String
    let height: Double
    let width: Double?

    var body: some View {
        ZStack{
            UnevenRoundedRectangle(
                cornerRadii: .init(
                    topLeading: 0.0,
                    bottomLeading: 0.0,
                    bottomTrailing: 15.0,
                    topTrailing: 15.0
                ),
                style: .continuous
            )
            .foregroundStyle(Color("CalculationSetCellBackGroundColor"))
            Text(calculationTitle)

        }
        .frame(height: height / 5)
        .padding([.trailing, .top], 10)

    }
    
    private func getText() -> String {
        //        switch type {
        //        case .percent:
        //            return String(format: "%.2f", calculatorModel.percent)
        //        case .accountBalance:
        //            return String(format: "%.2f", calculatorModel.accountBalance)
        //        case .pips:
        //            return String(format: "%.2f", calculatorModel.pips)
        //        }
        return ""
    }
}

