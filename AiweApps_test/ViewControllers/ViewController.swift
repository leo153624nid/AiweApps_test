//
//  ViewController.swift
//  AiweApps_test
//
//  Created by macbook on 01.03.2023.
//

import UIKit

class ViewController: UIViewController {
    private var apiCaller: APICallerProtocol
    
    private let tableView = CoinPersentageTableView()
    private let infoView = InfoView(with: "AltCoins:")

    private let parseButton = PrimaryButton(title: ButtonNames.parse.rawValue)
    private let showButton = PrimaryButton(title: ButtonNames.show.rawValue)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(parseButton)
        view.addSubview(tableView)
        view.addSubview(infoView)
        view.addSubview(showButton)
        
        setupView()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(parseAction),
                                               name: .notificationFromParseButton,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showAction),
                                               name: .notificationFromShowButton,
                                               object: nil)
    }
    
    init(with apiCaller: APICallerProtocol) {
        self.apiCaller = apiCaller
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.apiCaller = APICaller.shared
        super.init(coder: coder)
    }
    
    private func setupView() {
        // setup parseButton
        parseButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        parseButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        parseButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        parseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // setup tableView
        tableView.topAnchor.constraint(equalTo: parseButton.bottomAnchor, constant: 30).isActive = true
        tableView.bottomAnchor.constraint(equalTo: infoView.topAnchor, constant: -30).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // setup infoView
        infoView.bottomAnchor.constraint(equalTo: showButton.topAnchor, constant: -20).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        infoView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        infoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // setup showButton
        showButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        showButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        showButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        showButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func getAndWriteData() {
        apiCaller.fetchData { [weak self] result in
            switch result {
                case .success(let data):
                    print(data.marketCapPercentage.btc) // todo
                    DispatchQueue.main.async {
                        sleep(1)
                        self?.parseButton.setTitle(ButtonNames.parse.rawValue, for: .normal)
                        self?.parseButton.buttonIsOn = false
                    }
                case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    private func readData() {
        // todo
    }
    
    @objc func parseAction(notification: Notification) {
        if notification.name == Notification.Name.notificationFromParseButton {
            self.parseButton.setTitle(ButtonNames.fetching.rawValue, for: .normal)
//            getAndWriteData()
        }
    }
    
    @objc func showAction(notification: Notification) {
        if notification.name == Notification.Name.notificationFromShowButton {
            self.showButton.setTitle(ButtonNames.reading.rawValue, for: .normal)
            readData()
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }
    
    
}

