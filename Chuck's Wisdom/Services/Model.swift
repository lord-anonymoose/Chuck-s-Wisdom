//
//  Model.swift
//  Chuck's Wisdom
//
//  Created by Philipp Lazarev on 04.07.2024.
//
import Foundation
import RealmSwift



struct Quote: Decodable {
    let categories: [String]
    let createdAt: String
    let iconURL: String
    let id, updatedAt: String
    let url: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case categories
        case createdAt = "created_at"
        case iconURL = "icon_url"
        case id
        case updatedAt = "updated_at"
        case url, value
    }
}

extension Quote {
    func makeStored() -> StoredQuote{
        let storedCategories = List<String>()
        storedCategories.append(objectsIn: self.categories)
        let quote = StoredQuote(value: self.value,
                                categories: storedCategories)
        return quote
    }
}

class StoredQuote: Object {
    @Persisted var value: String = ""
    @Persisted var categories: List<String> = List()
    @Persisted var date: Date = Date()
    
    override init() {
        super.init()
    }

    init(value: String, categories: List<String>) {
        self.value = value
        self.categories = categories
        self.date = Date()
        super.init()
    }
}







