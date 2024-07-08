//
//  JailbreakViewController.swift
//  Chuck's Wisdom
//
//  Created by Philipp Lazarev on 08.07.2024.
//

import Foundation
import UIKit

class JailbreakViewController: UIViewController {
    
    
    
    // MARK: - Subviews
    private lazy var chuckImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "angryChuck")
        imageView.tintColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "This application is not available for devices with Jailbreak. We strongly condemn hacking iOS and installation of illegal software!"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addSubviews()
        setupConstraints()
    }
    
    
    
    // MARK: - Private
    private func setupUI() {
        
    }
    
    private func addSubviews() {
        view.addSubview(chuckImageView)
        view.addSubview(textLabel)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            chuckImageView.centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor, constant: -150),
            chuckImageView.heightAnchor.constraint(equalToConstant: 200),
            chuckImageView.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor),
            chuckImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: chuckImageView.bottomAnchor, constant: 20),
            textLabel.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -20),
            textLabel.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -20)
        ])
    }
}
