//
//  QuoteTableViewCell.swift
//  Chuck's Wisdom
//
//  Created by Philipp Lazarev on 07.07.2024.
//

import Foundation
import UIKit

import UIKit

class QuoteTableViewCell: UITableViewCell {

    let quoteLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(quoteLabel)
        contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            quoteLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            quoteLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            quoteLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(quote: String, date: Date) {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mm"
        let dateString = df.string(from: date)
        
        quoteLabel.text = quote
        dateLabel.text = dateString
    }
}
