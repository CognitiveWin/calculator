//
//  EngineTests.swift
//  calculator
//
//  Created by Scott McKenzie on 25/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import XCTest

class EngineTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInput_inputs_value() {
        
        let engine = Engine()
        
        XCTAssertTrue(engine.infix == "Ready")
        XCTAssertTrue(engine.postfix == "Ready")
        
        engine.add("6")
        XCTAssertTrue(engine.infix == "6")
        XCTAssertTrue(engine.postfix == "6")
        
        engine.add("x")
        XCTAssertTrue(engine.infix == "6x")
        XCTAssertTrue(engine.postfix == "6 ? x")
        
        engine.add("5")
        XCTAssertTrue(engine.infix == "6x5")
        XCTAssertTrue(engine.postfix == "6 5 x")
        
        engine.add("+")
        XCTAssertTrue(engine.infix == "6x5+")
        XCTAssertTrue(engine.postfix == "6 5 x ? +")
        
        engine.add("3")
        XCTAssertTrue(engine.infix == "6x5+3")
        XCTAssertTrue(engine.postfix == "6 5 x 3 +")
        
        engine.add("/")
        XCTAssertTrue(engine.infix == "6x5+3/")
        XCTAssertTrue(engine.postfix == "6 5 x 3 ? / +")
        
        engine.add("2")
        XCTAssertTrue(engine.infix == "6x5+3/2")
        XCTAssertTrue(engine.postfix == "6 5 x 3 2 / +")
        
        engine.add("-")
        XCTAssertTrue(engine.infix == "6x5+3/2-")
        XCTAssertTrue(engine.postfix == "6 5 x 3 2 / + ? -")
        
        engine.add("6")
        XCTAssertTrue(engine.infix == "6x5+3/2-6")
        XCTAssertTrue(engine.postfix == "6 5 x 3 2 / + 6 -")
        
        engine.add("=")
        XCTAssertTrue(engine.infix == "25.5")
        XCTAssertTrue(engine.postfix == "25.5")
        
        engine.add("+")
        XCTAssertTrue(engine.infix == "25.5+")
        XCTAssertTrue(engine.postfix == "25.5 ? +")
        
        engine.add("-")
        XCTAssertTrue(engine.infix == "25.5-")
        XCTAssertTrue(engine.postfix == "25.5 ? -")
        
        engine.add("3")
        XCTAssertTrue(engine.infix == "25.5-3")
        XCTAssertTrue(engine.postfix == "25.5 3 -")
        
        engine.add("0")
        XCTAssertTrue(engine.infix == "25.5-30")
        XCTAssertTrue(engine.postfix == "25.5 30 -")
        
        engine.add("=")
        XCTAssertTrue(engine.infix == "-4.5")
        XCTAssertTrue(engine.postfix == "-4.5")
        
        engine.add("C")
        XCTAssertTrue(engine.infix == "Ready")
        XCTAssertTrue(engine.postfix == "Ready")
    }
    
    func testInput_emptyExpression_nothing() {
        
        let engine = Engine()
        
        XCTAssertTrue(engine.infix == "Ready")
        XCTAssertTrue(engine.postfix == "Ready")
        
        engine.add("=")
        XCTAssertTrue(engine.infix == "Ready")
        XCTAssertTrue(engine.postfix == "Ready")
    }
}
