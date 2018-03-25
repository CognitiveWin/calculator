//
//  Engine.swift
//  calculator
//
//  Created by Scott McKenzie on 25/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import Foundation

final class Engine {
    
    var infix: String {
        
        guard inputs.count > 0 else { return "Ready" }
        
        return inputs.joined(separator: "")
    }
    
    var postfix: String {

        guard output.count > 0 else { return "Ready" }

        let shuntingYard = ShuntingYard(input: inputs)
        var postfix = shuntingYard.evaluate() + shuntingYard.operators.elements
        
        if postfix.count % 2 == 0 {
            
            let index = postfix.count - shuntingYard.operators.elements.count - 1
            
            postfix.insert("?", at: index)
        }

        return postfix.joined(separator: " ")
    }
    
    private var inputs: [String] = []
    private var output: [String] = []
    
    func add(_ input: String) {
        
        switch input {
            
        case "C":
            inputs = []
            output = []
            
        case "=":
            let algo = ShuntingYard(input: inputs)
            let postfix = algo.evaluate()
            
            let expression = Postfix(inputs: postfix)
            let result = expression.evaluate()
            
            inputs = []
            inputs.append(result.first!)
            output = [result.first!]
            
            break
            
        case "+", "x", "/", "-":
            
            if let op = inputs.last, ["+", "x", "/", "-"].contains(op) {
                inputs.removeLast()
            }
            
            inputs.append(input)
            
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            
            if let op = inputs.last, ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"].contains(op) {
                
                let value = "\(op)\(input)"

                inputs.removeLast()
                inputs.append(value)
                output.append(value)
            }
            else {
                
                inputs.append(input)
                output.append(input)
            }
            
        default:
            fatalError()
        }
    }
}
