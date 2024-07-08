//
//  Errors.swift
//  Chuck's Wisdom
//
//  Created by Philipp Lazarev on 04.07.2024.
//

import Foundation


// Network Functionality Errors
enum NetworkError: Error {
    case urlError
    case jsonError
    case networkError
    case httpResponseError
}

extension NetworkError {
    public var description: String {
        switch self {
        case .urlError:
            return "The URL is not valid!"
        case .jsonError:
            return "Couldn't parse JSON data!"
        case .networkError:
            return "Your connection is lost!"
        case .httpResponseError:
            return "HTTP Response Error!"
        }
    }
}
