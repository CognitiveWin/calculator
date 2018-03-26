//
//  ShuntingYard.swift
//  calculator
//
//  Created by Scott McKenzie on 18/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import Foundation

final class ShuntingYard {
    
    let input: [String]
    var output = Queue<String>()
    var operators = Stack<String>()
    
    init(input: [String]) {
        
        self.input = input
    }
    
    func evaluate() -> [String] {
        
        for token in input {
            process(token: token)
        }
        
        if let op = operators.pop() {
            output.enqueue(op)
        }
        
        return output.elements
    }

    func process(token: String) {
        
        debugPrint("State: \(output.elements.joined()) \(operators.elements.joined())")
        debugPrint("Token: \(token)")
        
        switch token {
            
        case "x", "/", "+", "-":

            var top = operators.peek()
            
            while let value = top, value.precedence >= token.precedence {
                
                let op = operators.pop()!
                output.enqueue(op)
                
                top = operators.peek()
            }

            operators.push(token)
            
        default:
            output.enqueue(token)
        }
    }
}

extension StringLiteralType {
    
    var precedence: Int8 {
        
        switch self {
            
        case "x", "/":
            return 20
            
        case "+", "-":
            return 10
            
        default:
            return 0
        }
    }
}
