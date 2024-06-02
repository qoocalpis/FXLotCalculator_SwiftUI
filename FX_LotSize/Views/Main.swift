//
//  Main.swift
//  FX_LotSize
//
//  Created by user1 on 2024/04/13.
//

import SwiftUI
import RealmSwift
import Network


struct Main: View {
    
    @State var rows = [[String: String]]()
    @State private var success = false
    
    var body: some View {
        if success {
            HomeTabView(rows: $rows)
        } else {
            FirstLoadingRateView()
                .task(){
                    await callGoogleSheetAPI()
                    setRealmData()
                }
        }
    }
    
    private func callGoogleSheetAPI() async {
        self.success = await GoogleSheetService.instance.callGoogleSheetAPI()
    }
    
    func setRealmData() {
        
        let realm = try! Realm()
        // データが存在するかどうかを確認
        let existingTradeModelData = realm.objects(TradeModel_04.self).first
        if let _ = existingTradeModelData {
            // データが存在する場合の処理
        }else{
            // データが存在しない場合の処理
            createTradeModelData();
        }
        
        // データが存在するかどうかを確認
        let existingMainCurrencyModelData = realm.objects(MainCurrencyModel.self).first
        if let _ = existingMainCurrencyModelData {
            // データが存在する場合の処理
        }else{
            // データが存在しない場合の処理
            createMainCurrencyModelData();
        }
        
        // データが存在するかどうかを確認
        let existingCurrencyPairModelData = realm.objects(CurrencyPairModel_04.self).first
        if let _ = existingCurrencyPairModelData {
            // データが存在する場合の処理
            try! realm.write {
                let getRecord = realm.objects(CurrencyPairModel_04.self).where{ $0.selected == true }.first!
                let record = CurrencyPairModel_04(value: ["currencyPair": getRecord.currencyPair, "selected": false, "register": true] as [String : Any])
                realm.add(record, update: .modified)
            }
            try! realm.write {
                let getRecord = realm.objects(TradeModel_04.self).first!
                let record = CurrencyPairModel_04(value: ["currencyPair": getRecord.defaultCurrencyPair, "selected": true, "register": true] as [String : Any])
                realm.add(record, update: .modified)
            }
        } else {
            // データが存在しない場合の処理
            createCurrencyPairModelData()
        }
    }
    
    func createTradeModelData() -> Void {
        
        let realm = try! Realm()
        
        try! realm.write {
            let record = TradeModel_04(value: ["id": 0, "lot": 10000, "losCutPercent": 0, "defaultCurrencyPair": "USD/JPY"] as [String : Any])
            realm.add(record, update: .modified)
        }
    }
    
    func createMainCurrencyModelData() -> Void {
        
        let realm = try! Realm()
        
        try! realm.write {
            let record = MainCurrencyModel(value: ["mainCurrency": "JPY"] as [String : Any])
            realm.add(record, update: .modified)
        }
    }
    
    func createCurrencyPairModelData() -> Void {
        
        let realm = try! Realm()
        
        for pair in AppConstants.allCurrencyPairs {
            if AppConstants.defaultCurrencyPairs.contains(pair) {
                try! realm.write {
                    let record = CurrencyPairModel_04(value: ["currencyPair": pair, "selected": false, "register": true] as [String : Any])
                    realm.add(record, update: .modified)
                }
            }else {
                try! realm.write {
                    let record = CurrencyPairModel_04(value: ["currencyPair": pair, "selected": false, "register": false] as [String : Any])
                    realm.add(record, update: .modified)
                }
            }
        }
        let targetRecord = realm.objects(TradeModel_04.self).first!
        let record = CurrencyPairModel_04(value: ["currencyPair": targetRecord.defaultCurrencyPair, "selected": true, "register": true] as [String : Any])
        try! realm.write {
            realm.add(record, update: .modified)
        }
    }
}
