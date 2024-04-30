//
//  LotSizeCalculatorModel.swift
//  FX_LotSize
//
//  Created by user1 on 2024/04/22.
//

import SwiftUI

enum UpdatePropertyType {
    case percent
    case accountBalance
    case pips
}

class LotSizeCalculatorModel: ObservableObject {
    @Published var percent: Double = 0
    @Published var accountBalance: Double = 0
    @Published var pips: Double = 0

    func updateProperty(_ value: String, _ type: UpdatePropertyType) {
        guard let doubleValue = Double(value) else { return }
        switch type {
        case .percent:
            percent = doubleValue
        case .accountBalance:
            accountBalance = doubleValue
        case .pips:
            pips = doubleValue
        }
    }
}
