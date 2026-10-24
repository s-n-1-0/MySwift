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
        guard var visibleViewController = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive })?
            .windows.first(where: { $0.isKeyWindow })?.rootViewController else {
             return nil
         }
         while let vc = visibleViewController.presentedViewController {
             visibleViewController = vc
         }
         return visibleViewController
     }
    
}
