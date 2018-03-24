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
        
        algo.calculate()
        
        XCTAssertEqual(["3", "4", "+"], algo.output.elements)
    }
    
    func testComplex() {
        
        let algo = ShuntingYard(input: ["6", "x", "5", "+", "3", "/", "2", "-", "6"])
        
        algo.calculate()
        
        XCTAssertEqual(algo.output.elements.joined(), "65x32/+6-")
    }
}
