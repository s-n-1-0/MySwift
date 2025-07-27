//
//  MockDateHandler.swift
//  MySwift
//
//  Created by Mac10 on 2025/07/23.
//

import Foundation

public class MockDateHandler: DateHandler {
    public var date: Date!
    public override func now() -> Date {
        return date
    }

    public static func mockNow(_ date: Date) {
        let mockDateHandler = MockDateHandler()
        mockDateHandler.date = date
        DateHandler.standard = mockDateHandler
    }
}
