//
//  UIview+Ext.swift
//  Assignmentt
//
//  Created by Jue Maria on 12/24/20.
//  Copyright © 2020 test. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    //Activity Starting
    func activityStartAnimating(Title: String,activityColor: UIColor, backgroundColor: UIColor) {
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.color = UIColor.white
        activityIndicator.startAnimating()
        let strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 160, height: 46))
        strLabel.text = Title
        strLabel.font = .systemFont(ofSize: 14, weight: .medium)
        strLabel.textColor = UIColor(white: 0.9, alpha: 0.7)
        effectView.frame = CGRect(x: self.frame.midX - strLabel.frame.width/2, y: self.frame.midY - strLabel.frame.height/2 , width: 160, height: 46)
        effectView.layer.cornerRadius = 15
        effectView.layer.masksToBounds = true
        effectView.contentView.addSubview(activityIndicator)
        effectView.contentView.addSubview(strLabel)
        backgroundView.addSubview(effectView)
        self.addSubview(backgroundView)
    }
    //Activity Stop
    func activityStopAnimating() {
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
}
}
