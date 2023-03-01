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
        getData()
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
        apiCaller.fetchData { result in
            switch result {
                case .success(let data): print(data.marketCapPercentage.btc)
                case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    

}

