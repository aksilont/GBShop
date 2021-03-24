//
//  GetReviewsView.swift
//  GBShop
//
//  Created by Aksilont on 23.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import UIKit

protocol GetReviewsTableViewDelegate: UITableViewDelegate, UITableViewDataSource {
}

class GetReviewsView: UIView {
    
    // MARK: - Public
    
    weak var delegateGetReviews: GetReviewsTableViewDelegate?
    
    // MARK: - Subviews
    
    lazy private var productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = NSLocalizedString("Reviews", comment: "")
        return label
    }()
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        guard let delegateGetReviews = self.delegateGetReviews else { return tableView }
        tableView.delegate = delegateGetReviews
        tableView.dataSource = delegateGetReviews
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellReview")
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    // MARK: - Init
    
    init(frame: CGRect, delegateGetReviews: GetReviewsTableViewDelegate) {
        self.delegateGetReviews = delegateGetReviews
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }
    
    // MARK: - UI
    
    func reloadTableData() {
        tableView.reloadData()
    }
    
    private func configureUI() {
        backgroundColor = .white
        addSubview(productNameLabel)
        addSubview(tableView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let paddingSide: CGFloat = 30.0
        
        NSLayoutConstraint.activate([
            
            productNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: paddingSide),
            productNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: productNameLabel.topAnchor, constant: paddingSide),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: paddingSide),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -paddingSide),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -paddingSide)
            ])
    }
}
