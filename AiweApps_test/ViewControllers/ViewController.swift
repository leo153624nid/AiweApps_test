//
//  ViewController.swift
//  AiweApps_test
//
//  Created by macbook on 01.03.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    private var apiCaller: APICallerProtocol
    
    private let tableView = CoinPersentageTableView()
    private let infoView = InfoView(with: "AltCoins:")

    private let parseButton = PrimaryButton(title: ButtonNames.parse.rawValue)
    private let showButton = PrimaryButton(title: ButtonNames.show.rawValue)
    
    private var dataArray = [MarketCapPercentage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CoinPersentageTableViewCell.self, forCellReuseIdentifier: CoinPersentageTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
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
    
    // Настройка View
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
    
    // Получение и запись данных
    private func getAndWriteData() {
        apiCaller.fetchData { [weak self] result in
            switch result {
                case .success(let data):
                    self?.dataArray.removeAll()

                    DispatchQueue.main.async {
                        // Очистка БД
                        self?.clearStore()
                        
                        // Сохранение в БД
                        for (key, value) in data.marketCapPercentage {
                            self?.saveItem(key: key, value: value)
                        }
                        
                        // работа с UI
                        sleep(1)
                        self?.parseButton.setTitle(ButtonNames.parse.rawValue, for: .normal)
                        self?.parseButton.buttonIsOn = false
                    }
                case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    // Сохранение в БД
    private func saveItem(key: String, value: Double) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "MarketCapPercentage",
                                                      in: context) else { return }
        let coinObject = MarketCapPercentage(entity: entity,
                                             insertInto: context)
        coinObject.coinName = key
        coinObject.coinPersentage = value
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    // Чтение из БД и обновление таблицы
    private func readData() {
        dataArray.removeAll()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<MarketCapPercentage> = MarketCapPercentage.fetchRequest()
        
        do {
            dataArray = try context.fetch(fetchRequest)

            DispatchQueue.main.async {
                self.showButton.setTitle(ButtonNames.show.rawValue, for: .normal)
                self.showButton.buttonIsOn = false
                self.tableView.reloadData()
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    // Очистка БД
    private func clearStore() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<MarketCapPercentage> = MarketCapPercentage.fetchRequest()
        
        do {
            try context.execute(NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>))
//            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    // Экшн по нажатию кнопки Parse
    @objc func parseAction(notification: Notification) {
        if notification.name == Notification.Name.notificationFromParseButton {
            self.parseButton.setTitle(ButtonNames.fetching.rawValue, for: .normal)
            getAndWriteData()
        }
    }
    
    // Экшн по нажатию кнопки Show
    @objc func showAction(notification: Notification) {
        if notification.name == Notification.Name.notificationFromShowButton {
            self.showButton.setTitle(ButtonNames.reading.rawValue, for: .normal)
            readData()
        }
    }
    
    // Бонус - подсчет обьема AltCoins
    private func showAltCoinsMarketCap() {
        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CoinPersentageTableViewCell.identifier,
            for: indexPath
        ) as? CoinPersentageTableViewCell else { fatalError() }
        
        cell.configure(with: dataArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

