//
//  Extensions.swift
//  Chuck's Wisdom
//
//  Created by Philipp Lazarev on 04.07.2024.
//

import UIKit



extension UIViewController {
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.view.tintColor = UIColor(named: "AccentColor")
        self.present(alert, animated: true, completion: nil)
    }
}

func isJailbroken() -> Bool {
    if let urlScheme = NSURL(string: "cydia://"),
       UIApplication.shared.canOpenURL(urlScheme as URL) {
        return true
    }
    
    do {
        try "text".data(using: .utf8)?.write(to: URL(filePath: "/test.txt"))
        return true
    } catch {
        
    }
    
    return false
}

func generateEncryptionKey() -> Data {
    var key = Data(count: 64)
    _ = key.withUnsafeMutableBytes { (pointer: UnsafeMutableRawBufferPointer) in
        SecRandomCopyBytes(kSecRandomDefault, 64, pointer.baseAddress!)
    }
    return key
}

/*
func getOrCreateEncryptionKey() -> Data {
    let keychain = KeychainSwift()
    let encryptionKeyKey = "com.yourapp.encryptionKey"
    
    // Check if the key already exists in the Keychain
    if let storedKey = keychain.getData(encryptionKeyKey) {
        // Use the stored key
        return storedKey
    } else {
        // Generate a new key and store it in the Keychain
        let newKey = generateEncryptionKey()
        keychain.set(newKey, forKey: encryptionKeyKey)
        return newKey
    }
}
*/
