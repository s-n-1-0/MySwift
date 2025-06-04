//
//  VC.swift
//  
//
//  Created by Mac10 on 2022/04/10.
//

import SwiftUI
import UIKit
extension View{
    public func getPresentedViewController()->UIViewController?{
        UIViewController.getPresentedViewController()
    }
}
extension UIViewController{
    public func getPresentedViewController()->UIViewController?{
        UIViewController.getPresentedViewController()
    }
    public static func getPresentedViewController()->UIViewController?{
        guard var visibleViewController = UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController else {
             return nil
         }
         while let vc = visibleViewController.presentedViewController {
             visibleViewController = vc
         }
         return visibleViewController
     }
    
}
