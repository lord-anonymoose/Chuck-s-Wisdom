//
//  GroupedQuotesViewController.swift
//  Chuck's Wisdom
//
//  Created by Philipp Lazarev on 04.07.2024.
//

import UIKit



class GroupedQuotesViewController: UIViewController {
    
    let databaseService = DatabaseService()
    var categories = [String]()
    
    // MARK: - Subviews
    private lazy var categoriesTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(QuoteTableViewCell.self, forCellReuseIdentifier: "GroupedQuotesViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCategories()
        setupUI()
        addSubviews()
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupCategories()
        categoriesTableView.reloadData()
    }
    
    
    
    // MARK: - Actions
    
    
    
    // MARK: - Private
    private func setupCategories() {
        self.categories = [String]()
        let allCategories = databaseService.fetchCategories()
        for category in allCategories {
            if !self.categories.contains(category) {
                self.categories.append(category)
            }
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Categories"
    }
    
    private func addSubviews() {
        view.addSubview(categoriesTableView)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            categoriesTableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            categoriesTableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            categoriesTableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            categoriesTableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor)
        ])
    }
}

extension GroupedQuotesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupedQuotesViewCell", for: indexPath)
        cell.textLabel?.text = self.categories[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = QuotesViewController(categoryFilter: self.categories[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}
