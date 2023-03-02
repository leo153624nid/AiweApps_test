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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


