//
//  ReversWordTestUITests.swift
//  ReversWordTestUITests
//
//  Created by Andrey Boyko on 25.09.2021.
//

import XCTest

class ReversWordTestUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let test: String = "Test string "
        let testString = ClassOfString(userString: test, reverseString: test)
        
        let app = XCUIApplication()
        app.launch()
        app.textFields["Enter your text here"].tap()
        app.textFields["Enter your text here"].typeText("\(test)")
        app.buttons["Result button"].tap()
        
        XCTAssertEqual("tseT gnirts ", testString.reversText(text: testString.userString))
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
