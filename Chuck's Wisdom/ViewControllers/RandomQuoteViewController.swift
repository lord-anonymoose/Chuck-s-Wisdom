//
//  ViewController.swift
//  Chuck's Wisdom
//
//  Created by Philipp Lazarev on 04.07.2024.
//
import Foundation
import UIKit
import RealmSwift


class RandomQuoteViewController: UIViewController {
    
    var currentQuote: Quote?
    
    // MARK: - Subviews
    private lazy var chuckImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "chuckImage2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var quoteTextView: UITextView = {
        let textView = UITextView()
        
        textView.isEditable = false
        textView.isSelectable = false
        textView.textAlignment = .center
        textView.backgroundColor = .secondarySystemBackground
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.sizeToFit()
        
        return textView
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
        
        button.addTarget(self, action: #selector(renewQuoteButtonTapped), for: .touchUpInside)
        
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
        
        button.addTarget(self, action: #selector(saveQuoteButtonTapped), for: .touchUpInside)

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
    @objc func renewQuoteButtonTapped() {
        self.setCurrentQuote()
    }
    
    @objc func saveQuoteButtonTapped() {
        if let quote = self.currentQuote {
            let databaseService = DatabaseService()
            databaseService.saveQuote(quote)
            print(databaseService.fetchQuotes())
        }
    }
    
    
    // MARK: - Private
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        let example = ["hello", "world"]
        let result = List<String>()

        result.append(objectsIn: example)
        
        let databaseService = DatabaseService()
        /*
        QuoteService.getCategoryList { categories in
            if let categories = categories {
                let service = DatabaseService(categories: categories)
                print(service.categories)
            } else {
                print("Failed to retrieve categories")
            }
        }
        */
    }
    
    private func addSubviews() {
        view.addSubview(chuckImageView)
        view.addSubview(quoteTextView)
        setCurrentQuote()
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
            quoteTextView.topAnchor.constraint(equalTo: chuckImageView.bottomAnchor, constant: 20),
            //quoteTextView.bottomAnchor.constraint(equalTo: renewButton.topAnchor, constant: -20),
            quoteTextView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 20),
            quoteTextView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -20)
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
    
    private func setCurrentQuote() {
        QuoteService.getRandomQuote { quote in
            if let quote = quote {
                DispatchQueue.main.async {
                    self.currentQuote = quote
                    self.quoteTextView.text = quote.value
                }
            } else {
                self.showAlert(message: "Failed to retrieve quote!")
            }
        }
    }
}

