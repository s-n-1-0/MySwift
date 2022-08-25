//
//  UIFont.swift
//  
//
//  Created by Mac10 on 2022/08/26.
//

import UIKit
extension UIFont.TextStyle{
    public var uiFont:UIFont{
        get{
            UIFont.preferredFont(forTextStyle: self)
        }
    }
}
