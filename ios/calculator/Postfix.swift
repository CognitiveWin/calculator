//
//  Postfix.swift
//  calculator
//
//  Created by Scott McKenzie on 15/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import Foundation

class Postfix {
    
    let inputs: [String]
    
    init(inputs: [String]) {
        self.inputs = inputs
    }
    
    func evaluate() -> [String] {
        
        let output = Stack<String>()
        
        inputs.forEach({ process(output: output, token: $0) })
        
        return output.elements
    }
    
    private func process(output: Stack<String>, token: String) {
        
        switch token {
            
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            output.push(token)
            
        case "+":
            let o2 = output.pop()!
            let o1 = output.pop()!
            
            let value = [Float(o2)!].reduce(Float(o1)!, +)
            output.push("\(value)")
            
        case "x":
            let o2 = output.pop()!
            let o1 = output.pop()!

            let value = [Float(o2)!].reduce(Float(o1)!, *)
            output.push("\(value)")

        case "/":
            let o2 = output.pop()!
            let o1 = output.pop()!
            
            let value = [Float(o2)!].reduce(Float(o1)!, /)
            output.push("\(value)")
            
        case "-":
            let o2 = output.pop()!
            let o1 = output.pop()!
            
            let value = [Float(o2)!].reduce(Float(o1)!, -)
            output.push("\(value)")
            
        default:
            fatalError()
        }
    }
}
