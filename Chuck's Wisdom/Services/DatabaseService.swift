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
    
    func fetchQuotes() -> [StoredQuote] {
        let realm = try! Realm()
        let quotes = realm.objects(StoredQuote.self)
        return quotes.map{ $0 }
    }
    
    func fetchCategories() -> [String] {
        var categories = [String]()

        let quotes = fetchQuotes()
        print(quotes.count)
        for quote in quotes {
            print(quote.categories.count)
            categories.append(contentsOf: quote.categories.map { $0 })
        }
        return categories
    }
    
}
