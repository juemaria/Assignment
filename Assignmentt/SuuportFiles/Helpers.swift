//
//  Helpers.swift
//  Assignmentt
//
//  Created by Jue Maria on 12/24/20.
//  Copyright © 2020 test. All rights reserved.
//

import Foundation
import UIKit

func showAlert(Message:String, controller: UIViewController) {
    let alert = UIAlertController(title: "Message", message: Message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    controller.present(alert, animated: true, completion: nil)
}
func showInternet(Message:String) {
    let alertWindow = UIWindow(frame: UIScreen.main.bounds)
    alertWindow.rootViewController = UIViewController()
    alertWindow.windowLevel = UIWindow.Level.alert + 1
    let alert = UIAlertController(title: "Message", message: Message, preferredStyle: .alert)
    alertWindow.makeKeyAndVisible()
    alertWindow.rootViewController?.present(alert, animated: true, completion: nil)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
}
