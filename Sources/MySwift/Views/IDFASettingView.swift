//
//  IDFASettingView.swift
//
//  Created by Mac10 on 2020/12/30.
//  Copyright © 2020 Mac10. All rights reserved.
//

import AppTrackingTransparency
import SwiftUI

public struct IDFASettingView: View {
    public let appColor:Color
    public let textColor:Color
    
    @Environment(\.dismiss) private var dismiss
    
    public var body: some View {
        VStack {
            Text("").frame(height: 15)
            HStack {
                Spacer()
                Image(systemName: "person.fill").resizable().frame(width: 25, height: 25).foregroundColor(appColor)
                Text("IDFATitle",bundle: .module).font(.title)
                Spacer()
            }
            Divider()
            HStack {
                Spacer()
                VStack {
                    Text("IDFAAnnounce",bundle: .module).font(.body)
                    Text("IDFAKome",bundle: .module).font(.caption)
                }
                Spacer()
            }
            Divider()
            Spacer(minLength: 15)
            Button(action: {
                switch ATTrackingManager.trackingAuthorizationStatus {
                case .authorized, .denied, .restricted:
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                case .notDetermined:
                    ATTrackingManager.requestTrackingAuthorization(completionHandler: { _ in })
                default:
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
                dismiss()
            }) {
                HStack {
                    Text("Continue",bundle: .module)
                }.frame(maxWidth: .infinity).padding([.top, .bottom]).foregroundColor(textColor)
            }.accentColor(textColor).background(appColor)
            .frame(width: 150).cornerRadius(10)
            Spacer(minLength: 15)
        }
    }
}

struct IDFASettingView_Previews: PreviewProvider {
    static var previews: some View {
        IDFASettingView(appColor: .red, textColor: .white)
    }
}
