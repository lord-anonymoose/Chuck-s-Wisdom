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
