//
//  Models.swift
//  AiweApps_test
//
//  Created by macbook on 01.03.2023.
//

import Foundation

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
    let eth: Double
    let usdt: Double
    let bnb: Double
    let usdc: Double
    let xrp: Double
    let ada: Double
    let okb: Double
    let doge: Double
    let matic: Double
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
