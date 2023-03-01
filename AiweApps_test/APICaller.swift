//
//  APICaller.swift
//  AiweApps_test
//
//  Created by macbook on 01.03.2023.
//

import Foundation

protocol APICallerProtocol {
    var constants: ConstantsProtocol { get }
    
    func getData(completion: @escaping (Result<[Article ], Error>) -> Void)
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
    
    public func getData(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = constants.dataURL else { fatalError("bad url") }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    
                    completion(.success(result.articles))
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
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable {
    let name: String
}
