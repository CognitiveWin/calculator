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
    
    private var buttonMapping: [UIButton: String] = [:]
    
    public let addButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setTitle("+", for: .normal)
        button.style.padButton()
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    public let subtractButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setTitle("-", for: .normal)
        button.style.padButton()
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    public let multiplyButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setTitle("x", for: .normal)
        button.style.padButton()
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return button
    }()

    public let divideButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setTitle("÷", for: .normal)
        button.style.padButton()
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return button
    }()

    public let equalButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setTitle("=", for: .normal)
        button.style.padButton()
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    weak var delegate: OperatorViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        buttonMapping[addButton] = "+"
        buttonMapping[subtractButton] = "-"
        buttonMapping[multiplyButton] = "x"
        buttonMapping[divideButton] = "/"
        buttonMapping[equalButton] = "="
        
        layout(options: LayoutOptions())
    }
    
    @objc func didTapButton(_ button: UIButton) {
        
        guard let key = buttonMapping[button] else {
            fatalError()
        }
        
        delegate?.didSelectValue(value: key)
    }
}
