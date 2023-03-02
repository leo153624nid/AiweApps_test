//
//  PrimaryButton.swift
//  AiweApps_test
//
//  Created by macbook on 01.03.2023.
//

import UIKit

class PrimaryButton: UIButton {
    var buttonIsOn = false { // todo
        didSet {
            self.backgroundColor = buttonIsOn ? UIColor.black : UIColor.lightGray
            self.setTitleColor(buttonIsOn ? UIColor.lightGray : UIColor.black, for: .normal)
        }
    }
    
//    button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
    
    init(title: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 12
        self.setTitleColor(.black, for: .normal)
        self.setTitleColor(.yellow, for: .highlighted)
        self.setTitle(title, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


