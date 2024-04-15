//
//  FeedbackView.swift
//  
//
//  Created by Mac10 on 2022/11/30.
//
import SwiftUI
import WebKit

public struct FeedbackView: View {
    public init(appType:FeedbackApp){
        let origin = "https://hello.sn-10.net"
        let params = FeedbackParams()
        self.url = URL(string: "\(origin)/apps/\(appType.rawValue)/feedback\(params.urlParams)")!
    }
    
    let url: URL
    public var body: some View{
        ProgressWebView(url: url, progressStyle: .circle)
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView(appType: .ChikuwaDiary)
    }
}
