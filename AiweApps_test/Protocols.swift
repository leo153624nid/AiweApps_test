//
//  Protocols.swift
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
