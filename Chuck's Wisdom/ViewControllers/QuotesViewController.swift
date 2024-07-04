//
//  AllQuotesViewController.swift
//  Chuck's Wisdom
//
//  Created by Philipp Lazarev on 04.07.2024.
//

import UIKit



class QuotesViewController: UIViewController {
    
    var quotes = [StoredQuote]()
    
    // MARK: - Subviews
    private lazy var quotesTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .green
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
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
        //let databaseService = DatabaseService()
        //print(databaseService.fetchCategories())
    }
    
    private func addSubviews() {
        view.addSubview(quotesTableView)
        
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            quotesTableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            quotesTableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            quotesTableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            quotesTableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor)
        ])
    }
}
