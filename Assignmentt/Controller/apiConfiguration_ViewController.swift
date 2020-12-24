//
//  Review_ViewController.swift
//  Assignmentt
//
//  Created by Jue Maria on 12/23/20.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit

class apiConfiguration_ViewController: UIViewController {
    
//IBOutlets
    @IBOutlet weak var APIKey_TextField: UITextField!
    @IBOutlet weak var endPoint_TextField: UITextField!
    @IBOutlet weak var holder_View: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        holder_View.layer.cornerRadius = 10
    }
    //Click on Submit Button
    @IBAction func onClickSubmit_Button(_ sender: UIButton) {
        if APIKey_TextField.text!.isEmpty || endPoint_TextField.text!.isEmpty {
            showAlert(Message: "Please fill the deatils", controller: self)
        }
        else
        {
Endpoint.instance.setEndpointAndKey(endPoint:endPoint_TextField.text!, Key:APIKey_TextField.text!)
            self.dismiss(animated: true, completion: nil)
        }
    }
    //Click on Close Button
    @IBAction func onClickCloseButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
