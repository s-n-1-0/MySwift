import XCTest
@testable import MySwift

final class MySwiftTests: XCTestCase {
    @MainActor func testParams() throws {
        let params = FeedbackParams()
        let url = URL(string:"https://test.com/hello"+params.urlParams)! //URLとして生成できるか
        print(url)
    }
}
