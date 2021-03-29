//
//  BasketView.swift
//  GBShop
//
//  Created by Aksilont on 26.03.2021.
//  Copyright © 2021 Aksilont. All rights reserved.
//

import UIKit

protocol BasketTableViewDelegate: UITableViewDelegate, UITableViewDataSource {
}

class BasketView: UIView {

    // MARK: - Public
    
    weak var delegate: BasketTableViewDelegate?
    
    // MARK: - Subviews
    
    lazy private var cartLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = NSLocalizedString("There are no products yet", comment: "")
        return label
    }()
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        guard let delegate = self.delegate else { return tableView }
        tableView.delegate = delegate
        tableView.dataSource = delegate
        tableView.register(UINib(nibName: "BasketTableViewCell", bundle: nil), forCellReuseIdentifier: "CellBasket")
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    lazy private var payBasketButton: UIButton = {
        let widthButton: CGFloat = 200.0
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("payBasketButton", comment: ""), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 15.0
        button.widthAnchor.constraint(equalToConstant: widthButton).isActive = true
        button.addTarget(self, action: #selector(payBasketDidTap), for: .touchUpInside)
        return button
    }()
    var actionPayBasketButton: (() -> Void)?
    
    // MARK: - Init
    
    init(frame: CGRect, delegate: BasketTableViewDelegate) {
        self.delegate = delegate
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }
    
    // MARK: - Selector actions
    
    @objc private func payBasketDidTap(sender: UIButton) {
        guard let actionPayBasketButton = actionPayBasketButton else { return }
        actionPayBasketButton()
    }
    
    // MARK: - UI
    
    func reloadTableData(isEmpty: Bool = true) {
        tableView.reloadData()
        cartLabel.isHidden = !isEmpty
    }
    
    private func configureUI() {
        backgroundColor = .white
        addSubview(cartLabel)
        addSubview(tableView)
        addSubview(payBasketButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let paddingSide: CGFloat = 10.0
        let paddingBottom: CGFloat = 50.0
        
        NSLayoutConstraint.activate([
            cartLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: paddingSide),
            cartLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: cartLabel.topAnchor, constant: paddingSide * 2),
            tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: paddingSide / 2),
            tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -paddingSide / 2),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -paddingSide / 2),
            
            payBasketButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -paddingBottom),
            payBasketButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
}
