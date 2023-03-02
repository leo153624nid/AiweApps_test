//
//  OutLabel.swift
//  AiweApps_test
//
//  Created by macbook on 02.03.2023.
//

import UIKit

class OutLabel: UILabel {
   
    
    init(text: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .cyan
        self.text = text
        self.textAlignment = .center
        self.numberOfLines = 0
        self.adjustsFontSizeToFitWidth = true
        self.sizeToFit()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 12
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


