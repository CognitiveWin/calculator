//
//  UIViewController+Layout.swift
//  calculator
//
//  Created by Scott McKenzie on 25/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import UIKit
import SnapKit

extension ViewController: Layout {
    
    func layout(options: LayoutOptions) {
        
        view.addSubview(displayView)
        displayView.addSubview(infixDisplay)
        displayView.addSubview(postfixDisplay)
        view.addSubview(padView)
        view.addSubview(operatorView)
        
        displayView.snp.makeConstraints { make in
            
            make.top.equalTo(view.snp.top).offset(40)
            make.left.equalTo(view).offset(40)
            make.right.equalTo(view).offset(-40)
            make.bottom.equalTo(padView.snp.top).offset(-40)
        }

        infixDisplay.snp.makeConstraints { make in
            make.bottom.equalTo(displayView.snp.centerY).offset(-10)
            make.left.equalTo(displayView).offset(50)
            make.right.equalTo(displayView).offset(-50)
            make.height.equalTo(50)
        }
        
        postfixDisplay.snp.makeConstraints { make in
            make.top.equalTo(displayView.snp.centerY).offset(10)
            make.left.equalTo(displayView).offset(50)
            make.right.equalTo(displayView).offset(-50)
            make.height.equalTo(50)
        }
        
        padView.snp.makeConstraints { make in
//            make.top.equalTo(infixDisplay.snp.bottom).offset(100)
//            make.centerX.equalTo(view)
//            make.height.equalTo(200)
//            make.width.equalTo(120)
            
            if #available(iOS 11, *) {
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
                make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
                make.width.equalTo(view.safeAreaLayoutGuide.snp.width).multipliedBy(3.0 / 4.0)
                make.height.equalTo(view.safeAreaLayoutGuide.snp.width).multipliedBy(options.buttonRatio * 6.0 / 4.0)
            } else {
                make.bottom.equalTo(view.snp.bottom)
                make.left.equalTo(view.snp.left)
                make.width.equalTo(view.snp.width).multipliedBy(3.0 / 4.0)
                make.height.equalTo(view.snp.width).multipliedBy(options.buttonRatio * 6.0 / 4.0)
            }
        }

        operatorView.snp.makeConstraints { make in
            
            if #available(iOS 11, *) {
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
                make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
                make.width.equalTo(view.safeAreaLayoutGuide.snp.width).multipliedBy(1.0 / 4.0)
                make.height.equalTo(view.safeAreaLayoutGuide.snp.width).multipliedBy(options.buttonRatio * 6.0 / 4.0)
            } else {
                make.bottom.equalTo(view)
                make.right.equalTo(view.snp.right)
                make.width.equalTo(view.snp.width).multipliedBy(1.0 / 4.0)
                make.height.equalTo(view.snp.width).multipliedBy(options.buttonRatio * 6.0 / 4.0)
            }
        }
    }
}
