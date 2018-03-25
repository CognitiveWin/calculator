//
//  ShuntingYardTests.swift
//  calculatorTests
//
//  Created by Scott McKenzie on 18/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import XCTest

class ShuntingYardTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSimple() {
        
        let algo = ShuntingYard(input: ["3", "+", "4"])
        
        let result = algo.evaluate()
        
        XCTAssertEqual(["3", "4", "+"], result)
    }
    
    func testComplex() {
        
        let algo = ShuntingYard(input: ["6", "x", "5", "+", "3", "/", "2", "-", "6"])
        
        let result = algo.evaluate()
        
        XCTAssertEqual(result, ["6", "5", "x", "3", "2", "/", "+", "6", "-"])
    }
}
