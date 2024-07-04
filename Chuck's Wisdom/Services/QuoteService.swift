//
//  QuoteService.swift
//  Chuck's Wisdom
//
//  Created by Philipp Lazarev on 04.07.2024.
//

import Foundation



struct QuoteService {
    static func getRandomQuote(completion: @escaping (Quote?) -> Void) {
        let urlString = "https://api.chucknorris.io/jokes/random"
        NetworkService.request(urlString: urlString) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let quote = try decoder.decode(Quote.self, from: data as! Data)
                    completion(quote)
                } catch {
                    print("Error decoding data!")
                    completion(nil)
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
    
    static func getCategoryList(completion: @escaping ([String]?) -> Void) {
        let urlString = "https://api.chucknorris.io/jokes/categories"
        NetworkService.request(urlString: urlString) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let categories = try decoder.decode([String].self, from: data as! Data)
                    completion(categories)
                } catch {
                    print("Error decoding data!")
                    completion(nil)
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
}
