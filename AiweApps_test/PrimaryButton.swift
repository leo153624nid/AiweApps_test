//
//  PrimaryButton.swift
//  AiweApps_test
//
//  Created by macbook on 01.03.2023.
//

import UIKit

class PrimaryButton: UIButton {
    var buttonIsOn = false {
        didSet {
            self.backgroundColor = buttonIsOn ? UIColor.black : UIColor.lightGray
            self.setTitleColor(buttonIsOn ? UIColor.white : UIColor.black, for: .normal)
        }
    }
    
    private var buttonName: String
    
    init(title: String) {
        self.buttonName = title
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 12
        self.setTitleColor(.black, for: .normal)
        self.setTitleColor(.yellow, for: .highlighted)
        self.setTitle("Обработка", for: .highlighted)
        self.setTitle(title, for: .normal)
        self.addTarget(self, action: #selector(buttonIsTapped), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonIsTapped(sender: UIButton) {
        print("\(buttonName)-button is tapped")
        buttonIsOn.toggle()
        NotificationCenter.default.post(Notification.init(name: buttonName == ButtonNames.parse.rawValue ? .notificationFromParseButton : .notificationFromShowButton))
    }
}


