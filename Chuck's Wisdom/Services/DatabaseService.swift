//
//  DatabaseService.swift
//  Chuck's Wisdom
//
//  Created by Philipp Lazarev on 04.07.2024.
//

import Foundation
import RealmSwift



class DatabaseService {
    
    var quotes = [StoredQuote]()
    
    func saveQuote(_ quote: Quote) {
        let storedQuote = quote.makeStored()
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(storedQuote)
        }
    }
    
    func deleteQuote(_ storedQuote: StoredQuote) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(storedQuote)
        }
    }
    
    func fetchQuotes() -> [StoredQuote] {
        do {
            let realm = try Realm()
            let quotes = realm.objects(StoredQuote.self)
            return Array(quotes)
        } catch {
            print("Failed to fetch quotes from Realm: \(error)")
            return []
        }
    }
    
    func fetchCategories() -> [String] {
        var categories = [String]()

        let quotes = fetchQuotes()
        for quote in quotes {
            categories.append(contentsOf: quote.categories.map { $0 })
        }
        return categories
    }
    
    func deleteAllQuotes() {
        let realm = try! Realm()
        
        try! realm.write {
            realm.deleteAll()
        }
    }
}
