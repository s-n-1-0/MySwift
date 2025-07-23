//
//  MockDateHandler.swift
//  MySwift
//
//  Created by Mac10 on 2025/07/23.
//

import Foundation

class MockDateHandler: DateHandler {
    var date: Date!
    override func now() -> Date {
        return date
    }

    @MainActor static func mockNow(_ date: Date) {
        let mockDateHandler = MockDateHandler()
        mockDateHandler.date = date
        DateHandler.standard = mockDateHandler
    }
}
