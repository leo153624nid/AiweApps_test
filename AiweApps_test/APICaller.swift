//
//  APICaller.swift
//  AiweApps_test
//
//  Created by macbook on 01.03.2023.
//

import Foundation

protocol APICallerProtocol {
    var constants: ConstantsProtocol { get }
    
    func fetchData(completion: @escaping (Result<Data, Error>) -> Void)
}

protocol ConstantsProtocol {
    var dataURL: URL? { get }
}

final class Constants: ConstantsProtocol {
    let dataURL: URL?
    
    init(with urlString: String) {
        self.dataURL = URL(string: urlString)
    }
}

final class APICaller: APICallerProtocol {
    static let shared: APICallerProtocol = APICaller()
    let constants: ConstantsProtocol = Constants(with: "https://api.coingecko.com/api/v3/global")
    
    private init() {}
    
    public func fetchData(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = constants.dataURL else { fatalError("bad url") }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    
                    completion(.success(result.data))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

// Models
struct APIResponse: Codable {
    let data: Data
}

struct Data: Codable {
    let activeCryptocurrencies: Int
    let upcomingIcos: Int
    let ongoingIcos: Int
    let endedIcos: Int
    let markets: Int
    let marketCapPercentage: CoinPersentage
    
    enum CodingKeys: String, CodingKey {
        case activeCryptocurrencies = "active_cryptocurrencies"
        case upcomingIcos = "upcoming_icos"
        case ongoingIcos = "ongoing_icos"
        case endedIcos = "ended_icos"
        case markets
        case marketCapPercentage = "market_cap_percentage"
    }
}

struct CoinPersentage: Codable {
    let btc: Double
}
