//
//  OperatorViewController+Layout.swift
//  calculator
//
//  Created by Scott McKenzie on 26/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import Foundation

extension OperatorViewController: Layout {
    
    func layout(options: LayoutOptions) {
        
        view.addSubview(addButton)
        view.addSubview(subtractButton)
        view.addSubview(multiplyButton)
        view.addSubview(divideButton)
        view.addSubview(equalButton)
        
        addButton.snp.makeConstraints { make in
            
            make.top.equalTo(view)
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.snp.width).multipliedBy(options.buttonRatio)
        }
        
        subtractButton.snp.makeConstraints { make in

            make.top.equalTo(addButton.snp.bottom)
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.snp.width).multipliedBy(options.buttonRatio)
        }

        multiplyButton.snp.makeConstraints { make in

            make.top.equalTo(subtractButton.snp.bottom)
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.snp.width).multipliedBy(options.buttonRatio)
        }

        divideButton.snp.makeConstraints { make in

            make.top.equalTo(multiplyButton.snp.bottom)
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.snp.width).multipliedBy(options.buttonRatio)
        }

        equalButton.snp.makeConstraints { make in

            make.top.equalTo(divideButton.snp.bottom)
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.snp.width).multipliedBy(options.buttonRatio * 2.0)
        }
    }
}
