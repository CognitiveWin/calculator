//
//  PadViewController.swift
//  calculator
//
//  Created by Scott McKenzie on 25/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import UIKit

protocol PadViewControllerDelegate: class {
    
    func didSelectValue(value: String)
}

final class PadViewController: UIViewController {
    
    weak var delegate: PadViewControllerDelegate?
    
    public let sevenButton: UIView = {
        
        let button = UIButton(type: .custom)
        button.setTitle("7", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

        return button
    }()

    public let eightButton: UIView = {
        
        let button = UIButton(type: .custom)
        button.setTitle("8", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

        return button
    }()

    public let nineButton: UIView = {
        
        let button = UIButton(type: .custom)
        button.setTitle("9", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return button
    }()

    public let fourButton: UIView = {
        
        let button = UIButton(type: .custom)
        button.setTitle("4", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

        return button
    }()

    public let fiveButton: UIView = {
        
        let button = UIButton(type: .custom)
        button.setTitle("5", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

        return button
    }()

    public let sixButton: UIView = {
        
        let button = UIButton(type: .custom)
        button.setTitle("6", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

        return button
    }()


    public let oneButton: UIView = {
        
        let button = UIButton(type: .custom)
        button.setTitle("1", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

        return button
    }()
    
    public let twoButton: UIView = {
        
        let button = UIButton(type: .custom)
        button.setTitle("2", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

        return button
    }()
    
    public let threeButton: UIView = {
        
        let button = UIButton(type: .custom)
        button.setTitle("3", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

        return button
    }()
    
    public let zeroButton: UIView = {
        
        let button = UIButton(type: .custom)
        button.setTitle("0", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    public let cancelButton: UIView = {
        
        let button = UIButton(type: .custom)
        button.setTitle("C", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    @objc func didTapButton(_ button: UIButton) {
        
        switch button {
            
        case nineButton:
            delegate?.didSelectValue(value: "9")
        case eightButton:
            delegate?.didSelectValue(value: "8")
        case sevenButton:
            delegate?.didSelectValue(value: "7")
        case sixButton:
            delegate?.didSelectValue(value: "6")
        case fiveButton:
            delegate?.didSelectValue(value: "5")
        case fourButton:
            delegate?.didSelectValue(value: "4")
        case threeButton:
            delegate?.didSelectValue(value: "3")
        case twoButton:
            delegate?.didSelectValue(value: "2")
        case oneButton:
            delegate?.didSelectValue(value: "1")
        case zeroButton:
            delegate?.didSelectValue(value: "0")
        case cancelButton:
            delegate?.didSelectValue(value: "C")

        default:
            fatalError()
        }
    }
}
