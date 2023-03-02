//
//  APICaller.swift
//  AiweApps_test
//
//  Created by macbook on 01.03.2023.
//

import Foundation

final class APICaller: APICallerProtocol {
    static let shared: APICallerProtocol = APICaller()
    let constants: ConstantsProtocol = Constants(with: "https://api.coingecko.com/api/v3/global")
    
    private init() {}
    
    public func fetchData(completion: @escaping (Result<DataClass, Error>) -> Void) {
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


