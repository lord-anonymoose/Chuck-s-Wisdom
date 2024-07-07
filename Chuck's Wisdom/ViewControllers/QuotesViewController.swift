//
//  AllQuotesViewController.swift
//  Chuck's Wisdom
//
//  Created by Philipp Lazarev on 04.07.2024.
//

import UIKit
import RealmSwift



class QuotesViewController: UIViewController {
    
    var quotes = [StoredQuote]()
    let databaseService = DatabaseService()
    
    // MARK: - Subviews
    private lazy var quotesTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuoteTableView()
        setupUI()
        addSubviews()
        setupConstraints()
        setupDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateQuoteTableView()
    }
    
    // MARK: - Actions
    
    
    
    // MARK: - Private
    private func setupUI() {
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "My Title"
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



extension QuotesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = QuoteTableViewCell()
        let quote = self.quotes[indexPath.row]
        cell.configure(quote: quote.value, date: quote.date)
        return cell
    }
    
    /*

     
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        directoryService.remove(at: indexPath.row)
        self.directoryTableView.reloadData()
    }
    */
    
    private func setupDelegates() {
        quotesTableView.dataSource = self
        quotesTableView.delegate = self
        quotesTableView.register(QuoteTableViewCell.self, forCellReuseIdentifier: "QuotesTableViewCell")
        quotesTableView.estimatedRowHeight = 100
        quotesTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func updateQuoteTableView() {
        self.quotes = databaseService.fetchQuotes().sorted(by: { $0.date < $1.date })
        quotesTableView.reloadData()
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.quotesTableView.reloadData()
        refreshControl.endRefreshing()
    }
}
