//
//  Constants.swift
//  AiweApps_test
//
//  Created by macbook on 01.03.2023.
//

import Foundation

final class Constants: ConstantsProtocol {
    let dataURL: URL?
    
    init(with urlString: String) {
        self.dataURL = URL(string: urlString)
    }
}
