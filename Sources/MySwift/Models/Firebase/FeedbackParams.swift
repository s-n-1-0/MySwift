//
//  FeedbackParams.swift
//  
//
//  Created by Mac10 on 2022/12/10.
//

import UIKit
public enum FeedbackApp:String{
    case ChikuwaDiary = "diary"
    case LifeCompass = "life-compass"
}

@MainActor
public struct FeedbackParams:Codable{
    init(){
        self.os = UIDevice.current.systemName.encodeParam
        self.os_version = UIDevice.current.systemVersion.encodeParam
        self.app_version = (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String).encodeParam
        self.device = UIDevice.current.name.encodeParam
        self.lang = NSLocalizedString("language",bundle: .module, comment: "en").encodeParam
    }
    let os:String
    let os_version:String
    let app_version:String
    let device:String
    let lang:String
    var urlParams:String{
        "?os=\(os)&os_version=\(os_version)&app_version=\(app_version)&device=\(device)&lang=\(lang)"
    }
}
fileprivate extension String{
    var encodeParam:String{
        self.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
    }
}
