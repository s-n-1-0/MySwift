//
//  SKProduct.swift
//  
//
//  Created by Mac10 on 2022/08/20.
//

import  StoreKit
extension SKProduct{
    /**
       通貨記号付き価格
       https://developer.apple.com/documentation/storekit/skproduct/1506094-price
     */
   public var localizedPrice:String {
        get{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .currency
            numberFormatter.locale = self.priceLocale
            return numberFormatter.string(from: self.price)!
        }
    }
}
