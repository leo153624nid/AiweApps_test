//
//  CoinPersentageTableView.swift
//  AiweApps_test
//
//  Created by macbook on 02.03.2023.
//

import UIKit

class CoinPersentageTableView: UITableView {

    init() {
        super.init(frame: .zero, style: .plain)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 12
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
