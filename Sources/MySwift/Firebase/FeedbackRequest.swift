//
//  FeedbackRequest.swift
//  
//
//  Created by Mac10 on 2022/12/10.
//

import UIKit
public enum FeedbackApp:String{
    case ChikuwaDiary = "ChikuwaDiary"
}
public class FeedbackRequest{
    init(_ origin:String,_ appType:FeedbackApp){
        self.origin = origin
        self.appType = appType
    }
    let origin:String
    let appType:FeedbackApp
    let os:String = ""
    public func send(message:String,completionHandler:@escaping (Data?,URLResponse?,Error?)->Void){
        let device = UIDevice.current
        let body = FeedbackRequestBody(app_id: appType.rawValue, os: device.systemName, os_version: device.systemVersion, app_version: Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String, device: device.name, message: message)
        
        let url = URL(string: origin + "/common/sendFeedback")!
        print(url)
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.httpBody = body.httpsBody
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: req,completionHandler: completionHandler)
        task.resume()
    }
}
struct FeedbackRequestBody:Codable{
    let app_id:String
    let os:String
    let os_version:String
    let app_version:String
    let device:String
    let message:String
    
    var httpsBody:Data?{
        get{
            let jsonEncoder = JSONEncoder()
            return try? jsonEncoder.encode(self)
        }
    }
}

