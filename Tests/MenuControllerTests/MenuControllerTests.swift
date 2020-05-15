import XCTest
@testable import MenuController

final class MenuControllerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MenuController().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
