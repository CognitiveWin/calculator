//
//  Stack.swift
//  calculator
//
//  Created by Scott McKenzie on 23/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import Foundation

public class Stack<T> {
    
    private(set) var elements: [T] = []
    
    func push(_ element: T) {
        
        elements.append(element)
    }
    
    func pop() -> T? {
        
        return elements.popLast()
    }
    
    func peek() -> T? {
        
        return elements.first
    }
    
    func empty() {
        
        elements = []
    }
}
