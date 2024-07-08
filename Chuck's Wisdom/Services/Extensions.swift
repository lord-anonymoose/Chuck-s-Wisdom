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
