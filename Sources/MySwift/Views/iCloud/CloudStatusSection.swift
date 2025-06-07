//
//  CloudStatusSection.swift
//  MySwift
//
//  Created by Mac10 on 2025/05/19.
//

import SwiftUI


public struct CloudStatusSection: View {
    public init() {
        let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
        
        annouceText = "CloudAnnounce".localizedModule.convertAt(with: appName ?? "")
        iCloudMode = (FileManager.default.url(forUbiquityContainerIdentifier: nil) != nil) ? "CloudAllow" : "CloudDeny"
    }
    
    let iCloudMode: String
    let annouceText:String
    
    public var body: some View {
        Section(header: Text("iCloud"), footer: Text(annouceText)) {
            HStack {
                Image(systemName: "cloud.fill")
                Text("CloudAccess".localizedModule)
                Spacer()
                Text(iCloudMode.localizedModule)
            }
        }
    }
}

#Preview {
    List{
        CloudStatusSection()
    }
}
