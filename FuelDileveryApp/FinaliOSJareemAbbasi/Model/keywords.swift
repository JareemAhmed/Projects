import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let findItemsByKeywordsResponse: [FindItemsByKeywordsResponse]?
}

// MARK: - FindItemsByKeywordsResponse
struct FindItemsByKeywordsResponse: Codable {
    let searchResult: [SearchResult]?
}

// MARK: - SearchResult
struct SearchResult: Codable {
    let item: [Item]?
}

// MARK: - Item
struct Item: Codable {
    let title: [String]?
    let galleryURL: [String]?
    let sellingStatus: [SellingStatus]?
}

// MARK: - SellingStatus
struct SellingStatus: Codable {
    let currentPrice: [ConvertedCurrentPrice]?
}

// MARK: - ConvertedCurrentPrice
struct ConvertedCurrentPrice: Codable {
    let currencyID: String?
    let value: String?
}
