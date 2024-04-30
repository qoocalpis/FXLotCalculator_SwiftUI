//
//  CurrencyPairModel.swift
//  FX_LotSize
//
//  Created by user1 on 2024/04/20.
//

import SwiftUI
import RealmSwift

class CurrencyPairModel_04: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true)  var currencyPair: String
    @Persisted var selected: Bool
    @Persisted var register: Bool
    
}
