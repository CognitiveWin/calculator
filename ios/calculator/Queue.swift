//
//  Queue.swift
//  calculator
//
//  Created by Scott McKenzie on 23/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import Foundation

final class Queue<T> {
    
    fileprivate(set) var elements: [T] = []

    func enqueue(_ element: T) {
        
        elements.append(element)
    }
    
    func dequeue() -> T? {
        
        guard elements.count > 0 else {
            
            return nil
        }
        
        return elements.remove(at: 0)
    }
    
    func peek() -> T? {
        
        return elements.first
    }
    
    var isEmpty: Bool {
        
        return elements.count == 0
    }
}
