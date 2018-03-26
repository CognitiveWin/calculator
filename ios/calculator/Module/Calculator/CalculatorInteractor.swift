//
//  CalculatorInteractor.swift
//  calculator
//
//  Created by Scott McKenzie on 26/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import Foundation

protocol CalculatorInteractorDelegate: class {

    func didUpdateInfix(_ infix: String)
    func didUpdatePostfix(_ postfix: String)
}

final class CalculatorInteractor {
    
    let engine: Engine
    weak var delegate: CalculatorInteractorDelegate?
    
    init() {
        self.engine = Engine()
    }
    
    func add(input: String) {
        
        engine.add(input)
        
        delegate?.didUpdateInfix(engine.infix)
        delegate?.didUpdatePostfix(engine.postfix)
    }
}
