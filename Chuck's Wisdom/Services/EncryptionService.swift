//
//  EncryptionService.swift
//  Chuck's Wisdom
//
//  Created by Philipp Lazarev on 08.07.2024.
//

import Foundation



struct EncryptionService {
    
    static func generateEncryptionKey() -> Data {
        var key = Data(count: 64)
        _ = key.withUnsafeMutableBytes { (pointer: UnsafeMutableRawBufferPointer) in
            SecRandomCopyBytes(kSecRandomDefault, 64, pointer.baseAddress!)
        }
        return key
    }
    
    static func getOrGenerateEncryptionKey() -> Data {
        guard let key = KeychainWrapper.standard.data(forKey: "EncryptionKey") else {
            let newKey = generateEncryptionKey()
            KeychainWrapper.standard.set(newKey, forKey: "EncryptionKey")
            return newKey
        }
        return key
    }
}
