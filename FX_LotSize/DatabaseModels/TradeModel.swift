//
//  TradeModel.swift
//  LotCalculatorApp
//
//  Created by 川人悠生 on 2023/03/07.
//

import SwiftUI
import RealmSwift

class TradeModel_04: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id = 0
    @Persisted var lot: Int                     //1ロットのサイズ
    @Persisted var losCutPercent: Int           //損失許容％
    @Persisted var defaultCurrencyPair: String  //初期設定の通貨ペア
}


