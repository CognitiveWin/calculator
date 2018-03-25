//
//  PostfixTests.swift
//  calculatorTests
//
//  Created by Scott McKenzie on 15/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import XCTest

class PostfixTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        
        let expression = ["4", "5", "6", "x", "+"]
        let postfix = Postfix(inputs: expression)
        
        let result = postfix.evaluate()
        XCTAssertEqual(result.first!, "34.0")
    }
    
    func testLongerExample() {
        
        let expression = ["6", "5", "x", "3", "2", "/", "+", "6", "-"]
        let postfix = Postfix(inputs: expression)
        
        let result = postfix.evaluate()
        XCTAssertEqual(result.first!, "25.5")
    }
}
