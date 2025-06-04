//
//  String.swift
//  
//
//  Created by Mac10 on 2022/12/11.
//
import UIKit
extension String{
    public func convertAt<key: StringProtocol>(with: key) -> String {
        return replacingOccurrences(of: "%@", with: with)
    }
    
    public var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    var localizedModule:String{
        return NSLocalizedString(self, bundle: .module,comment: self) as String
    }
}
