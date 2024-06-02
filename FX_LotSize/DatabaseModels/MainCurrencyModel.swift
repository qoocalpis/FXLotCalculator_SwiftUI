//
//  MainCurrency.swift
//  FX_LotSize
//
//  Created by 川人悠生 on 2024/06/02.
//

import SwiftUI
import RealmSwift

class MainCurrencyModel: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true)  var mainCurrency: String  //通貨ペア
    
}
