//
//  OperatorViewController.swift
//  calculator
//
//  Created by Scott McKenzie on 26/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import UIKit

protocol OperatorViewControllerDelegate: class {
    
    func didSelectValue(value: String)
}

final class OperatorViewController: UIViewController {
    
    public let addButton: UIView = {
        
        let button = UIButton(type: .custom)
        button.setTitle("+", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    public let subtractButton: UIView = {
        
        let button = UIButton(type: .custom)
        button.setTitle("-", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    public let multiplyButton: UIView = {
        
        let button = UIButton(type: .custom)
        button.setTitle("x", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return button
    }()

    public let divideButton: UIView = {
        
        let button = UIButton(type: .custom)
        button.setTitle("÷", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return button
    }()

    public let equalButton: UIView = {
        
        let button = UIButton(type: .custom)
        button.setTitle("=", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    weak var delegate: OperatorViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        layout()
    }
    
    @objc func didTapButton(_ button: UIButton) {
        
        switch button {
            
        case addButton:
            delegate?.didSelectValue(value: "+")
            
        case subtractButton:
            delegate?.didSelectValue(value: "-")
            
        case multiplyButton:
            delegate?.didSelectValue(value: "x")
            
        case divideButton:
            delegate?.didSelectValue(value: "/")
            
        case equalButton:
            delegate?.didSelectValue(value: "=")
            
        default:
            break
        }
    }
}
