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
    let infoText: Text?
    let height: Double
    @Binding var textField: String
    @Binding var focusEditable: Bool

    
    init(calculationTitleText: Text, infoText: Text? = nil, height: Double, textField: Binding<String>, focusEditable: Binding<Bool>) {
        self.calculationTitleText = calculationTitleText
        self.infoText = infoText
        self.height = height
        self._textField = textField
        self._focusEditable = focusEditable

    }
    
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
                    VStack{
//                        TextField(AppConstants.strEmpty, text: $textField)
//                            .keyboardType(.numberPad)
//                            .frame(width: 200)
//                            .multilineTextAlignment(.center)
//                            .focused(self.$focus)
//                            .toolbar {
//                                if focus {
//                                    ToolbarItemGroup(placement: .keyboard) {
//                                        Spacer()         // 右寄せにする
//                                        Button("閉じる") {
//                                            focus = false  //  フォーカスを外す
//                                        }
//                                    }
//                                }
//                            }
                        Button(action: {
                        focusEditable = true

                            print("aaaaaaaa")
                        }, label: {
                            Text(textField)
                                .frame(width: 200,height: 30)
                        })
                        Rectangle()
                            .frame(width: 200,height: 1)
                    }
                }
            }
            .padding(20)
        }
        .frame(height: height)
        .padding(.trailing, 25)
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

