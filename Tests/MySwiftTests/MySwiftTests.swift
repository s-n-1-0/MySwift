import XCTest
@testable import MySwift

final class MySwiftTests: XCTestCase {
    func testExample() throws {
        let str = NSLocalizedString("FeedbackView-Message", bundle: .module,comment: "")
        print(str)
    }
    
    func testFeedback(){
        let expect = expectation(description: "SendFeedbackRequest")
        let origin = "" //ここにURL (app repo参照)
        FeedbackRequest(origin,.ChikuwaDiary).send(message: "テスト送信\nテステス&test=valid"){
            _,_,_ in
            expect.fulfill()
        }
        waitForExpectations(timeout: 30)
    }
}
