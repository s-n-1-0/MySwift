//
//  DateHandler.swift
//  MySwift
//
//  Created by Mac10 on 2025/07/23.
//
import SwiftUI

/**
    XCTest用に現在時刻を上書きできるようにしたクラス
 */
public class DateHandler {
    @MainActor public static var standard: DateHandler = .init()

    public func now() -> Date {
        Date()
    }

    @MainActor public static func now() -> Date {
        standard.now()
    }
}

