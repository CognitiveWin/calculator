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
        
        let algo = ShuntingYard()
        
        algo.parse(infix: ["3", "+", "4"])
        
        XCTAssertEqual(["3", "4", "+"], algo.output)
    }
    
    func testComplex() {
        
        let algo = ShuntingYard()
        
        let infix = ["6", "x", "5", "+", "3", "/", "2", "-", "6"]
        
        algo.parse(infix: infix)
        
        XCTAssertEqual("65x32/+6-", algo.output.joined())
    }
}
