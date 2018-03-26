//
//  UIViewController+Layout.swift
//  calculator
//
//  Created by Scott McKenzie on 25/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import UIKit

extension ViewController {
    
    func layout() {
        
        view.addSubview(infixDisplay)
        view.addSubview(postfixDisplay)
        view.addSubview(padView)
        view.addSubview(operatorView)

        infixDisplay.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100)
            make.left.equalTo(view).offset(50)
            make.right.equalTo(view).offset(-50)
            make.height.equalTo(50)
        }
        
        postfixDisplay.snp.makeConstraints { make in
            make.top.equalTo(infixDisplay.snp.bottom).offset(10)
            make.left.equalTo(view).offset(50)
            make.right.equalTo(view).offset(-50)
            make.height.equalTo(50)
        }
        
        padView.snp.makeConstraints { make in
            make.top.equalTo(infixDisplay.snp.bottom).offset(100)
            make.centerX.equalTo(view)
            make.height.equalTo(200)
            make.width.equalTo(120)
        }

        operatorView.snp.makeConstraints { make in
            make.top.equalTo(padView)
            make.left.equalTo(padView.snp.right).offset(10)
            make.height.equalTo(240)
            make.width.equalTo(50)
        }
    }
}
