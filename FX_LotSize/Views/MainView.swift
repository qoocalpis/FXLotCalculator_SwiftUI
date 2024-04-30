//
//  Main.swift
//  FX_LotSize
//
//  Created by user1 on 2024/04/13.
//

import SwiftUI
import RealmSwift
import Network


struct MainView: View {
    
    @ObservedResults(TradeModel_04.self) var tradeModel
    @State var flag = 0
    @State var rows = [[String: String]]()
    @State var error: Error?
    @State private var success = false
    @ObservedObject var network = MonitoringNetworkState()
    @State private var isConnected = false
    
    var body: some View {
        if let tradeModel = tradeModel.first , success {
            HomeTabView(tradeModel: tradeModel, rows: $rows)
        } else {
            FirstLoadingRateView()
                .task(){
                    await callGoogleSheetAPI()
                    setRealmData()
                }
                .onChange(of: isConnected) {
                    Task{
                        await callGoogleSheetAPI()
                    }
                }
        }
    }
    
    private func callGoogleSheetAPI() async {
        self.success = await GoogleSheetService.instance.callGoogleSheetAPI()
    }
    
    func setRealmData() {
        
        let realm = try! Realm()
        // データが存在するかどうかを確認
        let existingData = realm.objects(TradeModel_04.self).first
        
        if let _ = existingData {
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
            createRealmData()
        }
    }
    
    func createRealmData() -> Void {
        
        let realm = try! Realm()
        
        try! realm.write {
            let record = TradeModel_04(value: ["id": 0, "lot": 10000, "losCutPercent": 0, "defaultCurrencyPair": "USD/JPY"] as [String : Any])
            realm.add(record, update: .modified)
        }
        for item in AppConstants.allCurrencyPairs {
            if AppConstants.defaultCurrencyPairs.contains(item) {
                try! realm.write {
                    let record = CurrencyPairModel_04(value: ["currencyPair": item, "selected": false, "register": true] as [String : Any])
                    realm.add(record, update: .modified)
                }
            }else {
                try! realm.write {
                    let record = CurrencyPairModel_04(value: ["currencyPair": item, "selected": false, "register": false] as [String : Any])
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
