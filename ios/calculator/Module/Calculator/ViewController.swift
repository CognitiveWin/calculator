//
//  ViewController.swift
//  calculator
//
//  Created by Scott McKenzie on 14/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    let interactor: CalculatorInteractor = CalculatorInteractor()
    
    let displayView: UIView = {
        
        let view = UIView()
        
        return view
    }()
    
    let infixDisplay: UILabel = {
        
        let label = UILabel()
        label.style.display()
        
        return label
    }()
    
    let postfixDisplay: UILabel = {
        
        let label = UILabel()
        label.style.display()
        
        return label
    }()
    
    let padView: UIView = {
       
        let view = UIView()
        view.backgroundColor = .clear
        
        return view;
    }()
    
    let padViewController: PadViewController = {
        
        let viewController = PadViewController()
        viewController.view.backgroundColor = .clear
        
        return viewController
    }()
    
    let operatorView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    let operatorViewController: OperatorViewController = {
       
        let viewController = OperatorViewController()
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.red.cgColor, UIColor.green.cgColor]
        view.layer.addSublayer(layer)
        
        interactor.delegate = self
        
        padViewController.delegate = self
        add(viewController: padViewController, container: padView)

        operatorViewController.delegate = self
        add(viewController: operatorViewController, container: operatorView)
        
        layout(options: LayoutOptions())
    }
}

extension ViewController: PadViewControllerDelegate, OperatorViewControllerDelegate {
    
    func didSelectValue(value: String) {
        
        interactor.add(input: value)
    }
}

extension ViewController: CalculatorInteractorDelegate {
    
    func didUpdateInfix(_ infix: String) {
        
        infixDisplay.text = infix
    }
    
    func didUpdatePostfix(_ postfix: String) {
        
        postfixDisplay.text = postfix
    }
}
