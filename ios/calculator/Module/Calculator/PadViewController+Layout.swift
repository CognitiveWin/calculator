//
//  PadViewController+Layout.swift
//  calculator
//
//  Created by Scott McKenzie on 25/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import Foundation

extension PadViewController: Layout {
    
    func layout() {
        
        view.addSubview(cancelButton)
        view.addSubview(zeroButton)
        view.addSubview(oneButton)
        view.addSubview(twoButton)
        view.addSubview(threeButton)
        view.addSubview(fourButton)
        view.addSubview(fiveButton)
        view.addSubview(sixButton)
        view.addSubview(sevenButton)
        view.addSubview(eightButton)
        view.addSubview(nineButton)

        sevenButton.snp.makeConstraints { make in
            
            make.top.equalTo(view)
            make.left.equalTo(view)
            make.height.width.equalTo(40)
        }
        
        eightButton.snp.makeConstraints { make in
            
            make.top.equalTo(view)
            make.centerX.equalTo(view)
            make.height.width.equalTo(40)
        }
        
        nineButton.snp.makeConstraints { make in
            
            make.top.equalTo(view)
            make.right.equalTo(view)
            make.height.width.equalTo(40)
        }

        fourButton.snp.makeConstraints { make in
            
            make.top.equalTo(sevenButton.snp.bottom)
            make.left.equalTo(view)
            make.height.width.equalTo(40)
        }
        
        fiveButton.snp.makeConstraints { make in
            
            make.top.equalTo(eightButton.snp.bottom)
            make.centerX.equalTo(view)
            make.height.width.equalTo(40)
        }
        
        sixButton.snp.makeConstraints { make in
            
            make.top.equalTo(sevenButton.snp.bottom)
            make.right.equalTo(view)
            make.height.width.equalTo(40)
        }

        oneButton.snp.makeConstraints { make in
            
            make.top.equalTo(fourButton.snp.bottom)
            make.left.equalTo(view)
            make.height.width.equalTo(40)
        }
        
        twoButton.snp.makeConstraints { make in
            
            make.top.equalTo(fiveButton.snp.bottom)
            make.centerX.equalTo(view)
            make.height.width.equalTo(40)
        }
        
        threeButton.snp.makeConstraints { make in
            
            make.top.equalTo(sixButton.snp.bottom)
            make.right.equalTo(view)
            make.height.width.equalTo(40)
        }
        
        zeroButton.snp.makeConstraints { make in
            
            make.top.equalTo(twoButton.snp.bottom)
            make.centerX.equalTo(view)
            make.height.width.equalTo(40)
        }
        
        cancelButton.snp.makeConstraints { make in
            
            make.top.equalTo(threeButton.snp.bottom)
            make.right.equalTo(view)
            make.height.width.equalTo(40)
        }
    }
}
