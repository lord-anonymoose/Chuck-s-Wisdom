//
//  ViewController.swift
//  Chuck's Wisdom
//
//  Created by Philipp Lazarev on 04.07.2024.
//

import UIKit

class RandomQuoteViewController: UIViewController {
    
    
    
    // MARK: - Subviews
    private lazy var chuckImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "chuckImage2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var quoteLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .secondarySystemBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var renewButton: UIButton = {
        let button = UIButton()
        button.tintColor = .red
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .default)
        let image = UIImage(systemName: "arrow.counterclockwise", withConfiguration: symbolConfig)
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 10.0
        button.backgroundColor = .secondarySystemFill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.tintColor = .red
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .bold, scale: .default)
        let image = UIImage(systemName: "arrow.down.app", withConfiguration: symbolConfig)
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 10.0
        button.backgroundColor = .secondarySystemFill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addSubviews()
        setupConstraints()
    }
    
    
    
    // MARK: - Actions
    
    
    
    // MARK: - Private
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func addSubviews() {
        view.addSubview(chuckImageView)
        view.addSubview(quoteLabel)
        view.addSubview(renewButton)
        view.addSubview(saveButton)
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
            quoteLabel.topAnchor.constraint(equalTo: chuckImageView.bottomAnchor, constant: 20),
            quoteLabel.bottomAnchor.constraint(equalTo: renewButton.topAnchor, constant: -20),
            quoteLabel.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 20),
            quoteLabel.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            renewButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -40),
            renewButton.heightAnchor.constraint(equalToConstant: 50),
            renewButton.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor, constant: -50),
            renewButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -40),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor, constant: 50),
            saveButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}

