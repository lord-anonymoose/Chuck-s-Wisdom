//
//  DatabaseService.swift
//  Chuck's Wisdom
//
//  Created by Philipp Lazarev on 04.07.2024.
//

import Foundation
import RealmSwift



class DatabaseService {
    
    /*
    var categories: [String] = []
    
    init(categories: [String]) {
        self.categories = categories
    }*/
    
    func saveQuote(_ quote: Quote) {
        let storedQuote = quote.makeStored()
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(storedQuote)
        }
    }
    
    func fetchQuotes() {
        let realm = try! Realm()
        let quotes = realm.objects(StoredQuote.self)
        print(quotes)
    }
    
}
