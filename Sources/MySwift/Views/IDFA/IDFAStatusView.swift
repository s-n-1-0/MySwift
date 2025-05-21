//
//  IDFAStatusView.swift
//  MySwift
//
//  Created by Mac10 on 2025/05/19.
//

import AppTrackingTransparency
import SwiftUI


public struct IDFAStatusView: View {
    public init(onTapGesture: @escaping () -> Void) {
        self.onTapGesture = onTapGesture
        
        switch ATTrackingManager.trackingAuthorizationStatus {
        case .authorized:
            _idfaMode = State(initialValue: "IDFAAvailable")
        case .notDetermined:
            _idfaMode = State(initialValue: "IDFAUnconfirmed")
        default:
            _idfaMode = State(initialValue: "IDFADeny")
        }
    }
    
    @State private var idfaMode: LocalizedStringKey = ""
    let onTapGesture: () -> Void
    
    public var body: some View {
        HStack {
            Image(systemName: "person.fill")
            Text("GetIDFA",bundle: .module)
            Spacer()
            Text(idfaMode,bundle: .module)
            Button(action: {
                idfaMode = "IDFAChecking"
                onTapGesture()
            }) {
                Image(systemName: "info.circle").foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    IDFAStatusView(onTapGesture: {
        
    })
}
