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
    var categoryFilter: String?
    
    // MARK: - Subviews
    private lazy var quotesTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(QuoteTableViewCell.self, forCellReuseIdentifier: "QuotesTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    
    // MARK: - Lifecycle
    convenience init() {
        self.init(categoryFilter: nil)
    }
    
    init(categoryFilter: String?) {
        self.categoryFilter = categoryFilter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuoteTableView()
        setupUI()
        addSubviews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateQuoteTableView()
    }
    
    // MARK: - Actions
    
    
    
    // MARK: - Private
    private func setupUI() {
        view.backgroundColor = .systemBackground
        if let filter = self.categoryFilter {
            self.navigationItem.title = filter
        } else {
            self.navigationItem.title = "Saved Quotes"
        }
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
        cell.selectionStyle = .none
        return cell
    }
     
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        databaseService.deleteQuote(self.quotes[indexPath.row])
        updateQuoteTableView()
    }
    
    private func updateQuoteTableView() {
        if let filter = categoryFilter {
            self.quotes = databaseService.fetchQuotes().sorted(by: { $0.date < $1.date }).filter({ $0.categories.contains(filter) })
        } else {
            self.quotes = databaseService.fetchQuotes().sorted(by: { $0.date < $1.date })

        }
        quotesTableView.reloadData()
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.quotesTableView.reloadData()
        refreshControl.endRefreshing()
    }
}
