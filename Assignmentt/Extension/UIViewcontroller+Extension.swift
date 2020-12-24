//
//  Navigation+Extension.swift
//  Assignmentt
//
//  Created by Jue Maria on 12/24/20.
//  Copyright © 2020 test. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    func hideNavigationBar(animated: Bool){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    func showNavigationBar(animated: Bool) {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
}
}

