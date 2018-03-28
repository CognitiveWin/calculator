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
    private var buttonMapping: [UIButton: String] = [:]
    
    public let sevenButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setTitle("7", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

        return button
    }()

    public let eightButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setTitle("8", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

        return button
    }()

    public let nineButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setTitle("9", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return button
    }()

    public let fourButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setTitle("4", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

        return button
    }()

    public let fiveButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setTitle("5", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

        return button
    }()

    public let sixButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setTitle("6", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

        return button
    }()


    public let oneButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setTitle("1", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

        return button
    }()
    
    public let twoButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setTitle("2", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

        return button
    }()
    
    public let threeButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setTitle("3", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)

        return button
    }()
    
    public let zeroButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setTitle("0", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    public let cancelButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.setTitle("C", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonMapping[nineButton] = "9"
        buttonMapping[eightButton] = "8"
        buttonMapping[sevenButton] = "7"
        buttonMapping[sixButton] = "6"
        buttonMapping[fiveButton] = "5"
        buttonMapping[fourButton] = "4"
        buttonMapping[threeButton] = "3"
        buttonMapping[twoButton] = "2"
        buttonMapping[oneButton] = "1"
        buttonMapping[zeroButton] = "0"
        buttonMapping[cancelButton] = "C"

        layout()
    }
    
    @objc func didTapButton(_ button: UIButton) {
        
        guard let key = buttonMapping[button] else {
            fatalError()
        }
        
        delegate?.didSelectValue(value: key)
    }
}
