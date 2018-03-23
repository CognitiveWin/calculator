//
//  ShuntingYard.swift
//  calculator
//
//  Created by Scott McKenzie on 18/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import Foundation

final class ShuntingYard {
    
    var output: [String] = []
    var operators: [String] = []
    
    var precendence: [String: Int] = ["x": 3, "/": 3, "+": 2, "-": 2]

    func parse(infix: [String]) {
        
        for token in infix {
            process(token: token)
        }
        process(token: "=")
    }
    
    func process(token: String) {
        
        debugPrint("State: \(output.joined()) \(operators.joined())")
        debugPrint("Token: \(token)")
        
        switch token {
            
        case "=":
            var op = operators.popLast()!
            output.append(op)
            
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            output.append(token)
            
        default:

            var top = operators.last
            
            while top != nil && precendence[top!]! >= precendence[token]! {
                
                var op = operators.popLast()!
                output.append(op)
                
                top = operators.last
            }

            operators.append(token)
        }
    }
}
