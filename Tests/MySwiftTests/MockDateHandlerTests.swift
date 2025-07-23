//
//  MockDateHandlerTests.swift
//  MySwift
//
//  Created by Mac10 on 2025/07/23.
//
import XCTest
@testable import MySwift

final class MockDateHandlerTests: XCTestCase {
    @MainActor func testNow() {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: 2020, month: 2, day: 1)
        let date = calendar.date(from: dateComponents)!
        MockDateHandler.mockNow(calendar.date(from: dateComponents)!)

        XCTAssertEqual(DateHandler.now(), date)
    }
}
