//
//  CloudStatusSection.swift
//  MySwift
//
//  Created by Mac10 on 2025/05/19.
//

import SwiftUI


public struct CloudStatusSection: View {
    public init() {
        iCloudMode = (FileManager.default.url(forUbiquityContainerIdentifier: nil) != nil) ? "CloudAllow" : "CloudDeny"
    }
    
    let iCloudMode: String
    
    public var body: some View {
        Section(header: Text("iCloud"), footer: Text("CloudAnnounce".localizedModule)) {
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
