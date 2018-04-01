//
//  Style.swift
//  calculator
//
//  Created by Scott McKenzie on 29/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import Foundation
import UIKit

public final class Style<T> {
    
    public let base: T
    
    public init(_ base: T) {
        
        self.base = base
    }
}

public protocol Styleable {
    
    associatedtype CompatibleType
    var style: CompatibleType { get }
}

public extension Styleable {
    
    public var style: Style<Self> {
        
        return Style(self)
    }
}

extension UIButton: Styleable {
    
}

extension Style where T: UIButton {
    
    func padButton() {
        
        assert(base.buttonType == .custom)
        
        base.backgroundColor = .clear
        base.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
}

extension UILabel: Styleable {
    
}

extension Style where T: UILabel {
    
    func display() {
        
        base.textAlignment = .right
        base.textColor = .white
        base.font = UIFont(name: "Verdana-Italic", size: 30)
        base.layer.cornerRadius = 5.0
        base.clipsToBounds = true
    }
}
