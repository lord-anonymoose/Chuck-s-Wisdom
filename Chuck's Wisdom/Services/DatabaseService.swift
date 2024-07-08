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
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(storedQuote)
            }
        } catch {
            print("Failed to write a quote: \(error)")
            return
        }
    }
    
    func deleteQuote(_ storedQuote: StoredQuote) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(storedQuote)
            }
        } catch {
            print("Failed to delete a quote: \(error)")
            return
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
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print("Failed to delete all quotes: \(error)")
            return
        }
    }
}
