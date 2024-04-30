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
    @Persisted var lot: Int
    @Persisted var losCutPercent: Int
    @Persisted var defaultCurrencyPair: String
}


