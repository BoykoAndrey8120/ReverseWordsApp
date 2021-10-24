//
//  ReversWordTestTests.swift
//  ReversWordTestTests
//
//  Created by Andrey Boyko on 25.09.2021.
//

import XCTest
@testable import ReversWordTest

class ReversWordTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testReversString () {
        let test = "Test string "
        var testString: ClassOfString
        testString = ClassOfString(userString: test, reverseString: test)
        XCTAssertEqual("tseT gnirts ", testString.reverseString)
    }
    
}

