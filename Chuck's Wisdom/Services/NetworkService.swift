//
//  NetworkService.swift
//  Chuck's Wisdom
//
//  Created by Philipp Lazarev on 04.07.2024.
//

import Foundation

struct NetworkService {

    static func request(urlString: String, completion: @escaping (Result<Any, Error>) -> Void) {
        switch getBaseURL(urlString: urlString) {
        case .success(let url):
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if let error = error as? URLError {
                    print("URLError code: \(error.code.rawValue)")
                } else {
                    if let error {
                        print("Error: \(error)")
                        completion(.failure(error))
                        return
                    }
                }
                
                guard response is HTTPURLResponse else {
                    print(NetworkError.httpResponseError.description)
                    completion(.failure(NetworkError.httpResponseError))
                    return
                }
                
                guard let data else {
                    print(NetworkError.jsonError.description)
                    completion(.failure(NetworkError.jsonError))
                    return
                }
                completion(.success(data as Data))
            }
            task.resume()
            
        case .failure(let error):
            completion(.failure(error))
            return
        }
    }
    
}

func getBaseURL(urlString: String) -> Result<URL, Error> {
    if let url = URL(string: urlString) {
        return .success(url)
    } else {
        return .failure(NetworkError.urlError)
    }
}
