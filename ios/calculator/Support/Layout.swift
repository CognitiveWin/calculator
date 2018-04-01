//
//  Layout.swift
//  calculator
//
//  Created by Scott McKenzie on 29/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import Foundation

protocol Layout {
    
    func layout(options: LayoutOptions)
}

final class LayoutOptions {
    
    var padding: Int {
        return 5
    }
    
    var buttonRatio: Float {
        
        return 2.0 / 3.0
    }
}
