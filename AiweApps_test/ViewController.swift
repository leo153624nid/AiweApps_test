//
//  ViewController.swift
//  AiweApps_test
//
//  Created by macbook on 01.03.2023.
//

import UIKit

class ViewController: UIViewController {
    private var apiCaller: APICallerProtocol

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    init(with apiCaller: APICallerProtocol) {
        self.apiCaller = apiCaller
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.apiCaller = APICaller.shared
        super.init(coder: coder)
    }
    
    private func getData() {
        apiCaller.getData { result in
            switch result {
                case .success(let data): print(data.marketCapPercentage.btc)
                case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    

}

