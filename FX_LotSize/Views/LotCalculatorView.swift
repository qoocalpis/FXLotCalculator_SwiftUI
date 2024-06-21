//
//  LotCalculatorView.swift
//  FX_LotSize
//
//  Created by user1 on 2024/04/21.
//
import RealmSwift
import SwiftUI

struct LotCalculatorView: View {
    
    @ObservedResults(TradeModel_04.self) var tradeModels
    @ObservedResults(MainCurrencyModel.self) var mainCurrencyModels
    
    //    @ObservedResults(CurrencyPairModel_04.self) var currencyPairModel
    @ObservedResults(CurrencyPairModel_04.self, where: ( { $0.selected == true} )) var selectedCurrencyPairModels
    @StateObject var storeKit = StoreKitManager()
    @StateObject var googleSheetService = GoogleSheetService.instance
    @State var accountBalanceText = AppConstants.strEmpty
    @State var lossAllowanceText = AppConstants.strEmpty
    @State var lossTolerancePipsText = AppConstants.strEmpty
    @State var focusEditable = false
    @FocusState var focusKeyBoard
    
    init(){
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0){
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
                    .foregroundStyle(Color("CurrentSelectedCurrencyPairBackGroundColor"))
                    
                    
                    VStack(spacing: 0) {
                        
                        Spacer()
                        //Text(selectedCurrencyPairModels.first!.currencyPair)
                        Text("USD/JPY")
                            .font(.title)
                            .italic()
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        Spacer()
                        
                        HStack(spacing: 10){
                            //dummy
                            Spacer()
                            
                            Text("rate")
                            
                            //                            Text(googleSheetService.list.first(where: { $0.currencyPair == selectedCurrencyPairModels.first!.currencyPair})?.rate ?? AppConstants.strEmpty)
                            Text("rate")
                                .bold()
                                .font(.title2)
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }){
                                Label("MyList", systemImage: "list.bullet.rectangle.fill")
                                    .padding(7)
                                    .foregroundColor(.white)
                                    .bold()
                                    .background(.green)
                                    .cornerRadius(5)
                                    .shadow(color: Color.black, radius: 2, x: 0, y: 1)
                            }
                            .frame(width: 100)
                            .padding(.trailing, 15)
                        }
                        Spacer()
                            .frame(height: AppConstants.spacer10)
                    }
                }
                
                Spacer()
                    .frame(height: AppConstants.spacer10)
                
                CalculationSetCell(
                    //                    calculatorModel: LotSizeCalculatorModel,
                    calculationTitleText: Text("accountBalance"),
                    //                    infoText: Text("(") + Text(mainCurrencyModels.first!.mainCurrency) + Text(")"),
                    height: geometry.size.height / 5,
                    textField: $accountBalanceText,
                    focusEditable: $focusEditable
                )
                
                Spacer()
                    .frame(height: AppConstants.spacer10)
                
                CalculationSetCell(
                    //                    calculatorModel: LotSizeCalculatorModel,
                    calculationTitleText: Text("lossAllowance") + Text("(%)"),
                    height: geometry.size.height / 5,
                    textField: $lossAllowanceText,
                    focusEditable: $focusEditable
                )
                
                Spacer()
                    .frame(height: AppConstants.spacer10)
                
                CalculationSetCell(
                    //                    calculatorModel: LotSizeCalculatorModel,
                    calculationTitleText: Text("lossTolerancePips"),
                    height: geometry.size.height / 5,
                    textField: $lossTolerancePipsText,
                    focusEditable: $focusEditable
                )
                
                Spacer()
                    .frame(height: AppConstants.spacer10)
                
                Button(action: {
                    print("tap buton")
                }) {
                    Text("calculate")
                }
                .padding()
                .frame(minWidth: geometry.size.width / 2)
                .accentColor(Color.black)
                .background(Color.yellow)
                .cornerRadius(15)
                .shadow(color: Color.black, radius: 2, x: 0, y: 1)
                
                Spacer()
                    .frame(height: AppConstants.spacer20)
            }
            .ignoresSafeArea(.all)
            
            if focusEditable{
                
                Color.black
                    .opacity(0.9)
                
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    LotCalculatorView()
}
