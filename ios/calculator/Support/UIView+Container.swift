//
//  UIView+Module.swift
//  calculator
//
//  Created by Scott McKenzie on 26/03/18.
//  Copyright © 2018 Cognitive Win. All rights reserved.
//

import UIKit
import SnapKit

extension UIViewController {
    
    // MARK: Container
    
    func add(viewController: UIViewController, container: UIView) {
        
        addChildViewController(viewController)
        container.addSubview(viewController.view)
        viewController.didMove(toParentViewController: self)
        
        viewController.view.snp.makeConstraints { make in
            make.edges.equalTo(container)
        }
    }
}
