//
//  ReviewRequestAlert.swift
//  Diarrrrrrrrrry
//
//  Created by Mac10 on 2025/06/01.
//  Copyright © 2025 Mac10. All rights reserved.
//

import SwiftUI

public class ReviewRequestAlert: ObservableObject {
    public init(){}
    
    @Published public var alertItem: AlertItem?

    public func generate(title: String, message: String, goodButtonText: String, goodMessage: String, goodEndAction: @escaping () -> Void, badButtonText: String, badMessage: String, badAction: @escaping () -> Void, badEndAction: @escaping () -> Void) {
        alertItem = AlertItem(alert: Alert(title: Text(title), message: Text(message), primaryButton: .default(Text(goodButtonText), action: {
            self.alertItem = AlertItem(alert: Alert(title: Text(""), message: Text(goodMessage), dismissButton: .default(Text("OK"), action: goodEndAction)))
        }), secondaryButton: .destructive(Text(badButtonText), action: {
            badAction()
            self.alertItem = AlertItem(alert: Alert(title: Text(""), message: Text(badMessage), dismissButton: .default(Text("OK"), action: badEndAction)))
        }))
        )
    }
}

public struct AlertItem: Identifiable {
    public init(alert: Alert) {
        self.alert = alert
    }
    
    public var id = UUID()
    public var alert: Alert
}
