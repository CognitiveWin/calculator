//
//  OperatorViewController+Layout.swift
//  calculator
//
//  Created by Scott McKenzie on 26/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import Foundation

extension OperatorViewController: Layout {
    
    func layout() {
        
        view.addSubview(addButton)
        view.addSubview(subtractButton)
        view.addSubview(multiplyButton)
        view.addSubview(divideButton)
        view.addSubview(equalButton)
        
        addButton.snp.makeConstraints { make in
            
            make.top.equalTo(view)
            make.centerX.equalTo(view)
            make.height.width.equalTo(40)
        }
        
        subtractButton.snp.makeConstraints { make in

            make.top.equalTo(addButton.snp.bottom)
            make.centerX.equalTo(view)
            make.height.width.equalTo(40)
        }

        multiplyButton.snp.makeConstraints { make in

            make.top.equalTo(subtractButton.snp.bottom)
            make.centerX.equalTo(view)
            make.height.width.equalTo(40)
        }

        divideButton.snp.makeConstraints { make in

            make.top.equalTo(multiplyButton.snp.bottom)
            make.centerX.equalTo(view)
            make.height.width.equalTo(40)
        }

        equalButton.snp.makeConstraints { make in

            make.top.equalTo(divideButton.snp.bottom)
            make.centerX.equalTo(view)
            make.height.width.equalTo(40)
        }
    }
}
