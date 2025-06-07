//
//  CloudStatusSection.swift
//  MySwift
//
//  Created by Mac10 on 2025/05/19.
//

import SwiftUI
import CloudKit

public struct CloudStatusSection: View {
    public init(cloudType:CloudType) {
        let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
        
        annouceText = "CloudAnnounce".localizedModule.convertAt(with: appName ?? "")
        self.cloudType = cloudType
    }
    
    @State private var iCloudMode: String = ""
    let cloudType:CloudType
    let annouceText:String
    
    public var body: some View {
        Section(header: Text("iCloud"), footer: Text(annouceText)) {
            HStack {
                Image(systemName: "cloud.fill")
                Text("CloudAccess".localizedModule)
                Spacer()
                Text(iCloudMode.localizedModule)
            }
        }.onAppear{
            switch cloudType{
            case .Document:
                iCloudMode = (FileManager.default.url(forUbiquityContainerIdentifier: nil) != nil) ? "CloudAllow" : "CloudDeny"
            case .Kit:
                let container = CKContainer.default()

                 container.accountStatus { status, error in
                     Task{
                         @MainActor in
                         switch status {
                         case .available:
                             iCloudMode = "CloudAllow"
                         default:
                             iCloudMode = "CloudDeny"
                         }
                     }
                 }
            }
        }
    }
}

public enum CloudType{
    case Kit
    case Document
}

#Preview {
    List{
        CloudStatusSection(cloudType: .Kit)
    }
}
