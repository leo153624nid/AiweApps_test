//
//  Models.swift
//  AiweApps_test
//
//  Created by macbook on 01.03.2023.
//

import Foundation

struct APIResponse: Codable {
    let data: DataClass
}

struct DataClass: Codable {
    let activeCryptocurrencies: Int
    let upcomingIcos: Int
    let ongoingIcos: Int
    let endedIcos: Int
    let markets: Int
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
        let marketCapChangePercentage24HUsd: Double
        let updatedAt: Int
    
    enum CodingKeys: String, CodingKey {
        case activeCryptocurrencies = "active_cryptocurrencies"
        case upcomingIcos = "upcoming_icos"
        case ongoingIcos = "ongoing_icos"
        case endedIcos = "ended_icos"
        case markets
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
        case updatedAt = "updated_at"
    }
}

struct CoinPersentageTableViewCellViewModel { // todo
    var coinName: String
    var coinPersentage: Double
    
    init(name: String, persentage: Double) {
        self.coinName = name
        self.coinPersentage = persentage
    }
}

extension Notification.Name {
    static let notificationFromParseButton = Notification.Name("notificationFromParseButton")
    static let notificationFromShowButton = Notification.Name("notificationFromShowButton")
}

enum ButtonNames: String {
    case parse = "Parse"
    case show = "Show"
    case fetching = "Fetching"
    case reading = "Reading"
}
