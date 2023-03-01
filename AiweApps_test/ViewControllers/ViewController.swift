//
//  ViewController.swift
//  AiweApps_test
//
//  Created by macbook on 01.03.2023.
//

import UIKit

class ViewController: UIViewController {
    private var apiCaller: APICallerProtocol
    
    private let nameCoinLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let persentageCoinLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let parseButton = PrimaryButton(title: "Parse")
    private let showButton = PrimaryButton(title: "Show")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(parseButton)
        view.addSubview(showButton)
        
        setupView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(parseAction), name: .notificationFromParseButton, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showAction), name: .notificationFromShowButton, object: nil)
        getData() // todo
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
                case .success(let data): print(data.marketCapPercentage.btc) // todo
                case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    private func setupView() {
        // setup parseButton
        parseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        parseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        parseButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        parseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }
    
    @objc func parseAction(notification: Notification) {
        if notification.name == Notification.Name.notificationFromParseButton {
//            let alertController = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", preferredStyle: .alert)
//            let action = UIAlertAction(title: "Закрыть", style: .default, handler: { action in
//                print("action")
//            })
//
//            alertController.addAction(action)
//            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc func showAction(notification: Notification) {
        if notification.name == Notification.Name.notificationFromShowButton {
//            let alertController = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", preferredStyle: .alert)
//            let action = UIAlertAction(title: "Закрыть", style: .default, handler: { action in
//                print("action")
//            })
//
//            alertController.addAction(action)
//            self.present(alertController, animated: true, completion: nil)
        }
    }
    

}

