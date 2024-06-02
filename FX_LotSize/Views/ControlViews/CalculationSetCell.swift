//
//  CalculationSetCell.swift
//  FX_LotSize
//
//  Created by user1 on 2024/04/22.
//

import SwiftUI


struct CalculationSetCell: View {
    //    @EnvironmentObject var calculatorModel: LotSizeCalculatorModel
    let calculationTitleText: Text
    let infoText: Text
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
            VStack{
                HStack{
                    calculationTitleText
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    Spacer()
                    infoText
                }
                Spacer()
                HStack{
                    Spacer()
                    Text("sssss")
                }
            }
            .padding(20)
            
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

