//
//  InfoView.swift
//  AiweApps_test
//
//  Created by macbook on 02.03.2023.
//

import UIKit

class InfoView: UIView {
    var nameCoinLabel: OutLabel
    var persentageCoinLabel = OutLabel(text: "persentage")

    init(with title: String) {
        self.nameCoinLabel = OutLabel(text: title)
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 12

        self.addSubview(nameCoinLabel)
        self.addSubview(persentageCoinLabel)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        // setup nameCoinLabel
        nameCoinLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        nameCoinLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameCoinLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
        nameCoinLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -70).isActive = true
        
        // setup persentageCoinLabel
        persentageCoinLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        persentageCoinLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        persentageCoinLabel.widthAnchor.constraint(equalToConstant: 130).isActive = true
        persentageCoinLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 70).isActive = true
    }

}
