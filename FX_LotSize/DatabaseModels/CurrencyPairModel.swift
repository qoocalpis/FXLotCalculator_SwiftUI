//
//  CurrencyPairModel.swift
//  FX_LotSize
//
//  Created by user1 on 2024/04/20.
//

import SwiftUI
import RealmSwift

class CurrencyPairModel_04: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true)  var currencyPair: String  //通貨ペア
    @Persisted var selected: Bool                           //選択状態
    @Persisted var register: Bool                           //登録状態

}
